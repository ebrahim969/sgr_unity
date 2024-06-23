import 'package:sgr_unity/features/blog/domain/entities/saved_blog_entity.dart';

class SavedBlogsModel extends SavedBlog {
  SavedBlogsModel({required super.userId, required super.blogId});

  factory SavedBlogsModel.fromJson(Map<String, dynamic> jsonData) {
    return SavedBlogsModel(
      userId: jsonData['user_id'] as String,
      blogId: jsonData['blog_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': userId,
      'blog_id': blogId,
    };
  }
}
