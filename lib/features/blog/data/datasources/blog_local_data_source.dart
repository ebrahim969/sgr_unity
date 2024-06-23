import 'package:hive/hive.dart';
import 'package:sgr_unity/core/common/models/blog_model.dart';

abstract interface class BlogLocalDataSource {
  void uploadLocalBlogs({required List<BlogModel> blogs});
  void uploadSevedUserBlogs({required List<BlogModel> savedBlogs});
  List<BlogModel> loadBlogs();
  List<BlogModel> loadSavedBlogs();
  void toggleSavedBlog(BlogModel blog);
}

class BlogLocalDataSourceImpl implements BlogLocalDataSource {
  final Box box;
  final String savedBlogsKey = 'savedBlogs';

  BlogLocalDataSourceImpl(this.box);
  @override
  List<BlogModel> loadBlogs() {
    List<BlogModel> blogs = [];
    box.read(() {
      for (int i = 0; i < box.length; i++) {
        blogs.add(BlogModel.fromJson(box.get(i.toString())));
      }
    });
    return blogs;
  }

  @override
  void uploadLocalBlogs({required List<BlogModel> blogs}) {
    box.clear();
    box.write(() {
      for (int i = 0; i < blogs.length; i++) {
        box.put(i.toString(), blogs[i].toJson());
      }
    });
  }

  @override
  void uploadSevedUserBlogs({required List<BlogModel> savedBlogs}) {
    box.put(savedBlogsKey, savedBlogs.map((blog) => blog.toJson()).toList());
  }

  @override
  List<BlogModel> loadSavedBlogs() {
    List<BlogModel> savedBlogs = [];
    final savedBlogsList = box.get(savedBlogsKey) as List?;
    if (savedBlogsList != null) {
      for (var blogJson in savedBlogsList) {
        savedBlogs.add(BlogModel.fromJson(blogJson).copyWith(
            posterName: blogJson['profiles']['name'],
            posterAvatar: blogJson['profiles']['profile_avatar']));
      }
    }
    return savedBlogs;
  }

  @override
  void toggleSavedBlog(BlogModel blog) {
    List<BlogModel> savedBlogs = loadSavedBlogs();
    if (savedBlogs.any((savedBlog) => savedBlog.id == blog.id)) {
      savedBlogs.removeWhere((savedBlog) => savedBlog.id == blog.id);
    } else {
      savedBlogs.add(blog);
    }
    uploadSevedUserBlogs(savedBlogs: savedBlogs);
  }
}
