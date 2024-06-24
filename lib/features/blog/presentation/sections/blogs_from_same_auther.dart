import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/utils/custom_loader.dart';
import 'package:sgr_unity/core/utils/custom_toast.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/blog_from_same_auther_item.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_any_user_blogs/get_any_user_blogs_bloc.dart';

class BlogsFromSameAuther extends StatefulWidget {
  const BlogsFromSameAuther({super.key, required this.blog});
  final Blog blog;
  @override
  State<BlogsFromSameAuther> createState() => _BlogsFromSameAutherState();
}

class _BlogsFromSameAutherState extends State<BlogsFromSameAuther> {
  @override
  void initState() {
    context
        .read<GetAnyUserBlogsBloc>()
        .add(EventGetAnyUserBlogs(widget.blog.posterId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAnyUserBlogsBloc, GetAnyUserBlogsState>(
      listener: (context, state) {
        if (state is GetAnyUserBlogsFailure) {
          showToast(state.errorMessage, context);
        }
      },
      builder: (context, state) {
        if (state is GetAnyUserBlogsLoading) {
          return const Center(child: CustomLoader());
        } else if (state is GetAnyUserBlogsSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                final reversedBlogs = state.blogs.reversed.toList();
                return BlogFromSameAutherItem(blog: reversedBlogs[index]);
              });
        }
        return const SizedBox();
      },
    );
  }
}
