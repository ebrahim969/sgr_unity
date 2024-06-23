import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/utils/custom_toast.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/user_saved_blogs/user_saved_blogs_bloc.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';

class CustomSavedBlogWidget extends StatelessWidget {
  const CustomSavedBlogWidget({
    super.key,
    required this.blog,
  });
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserSavedBlogsBloc, UserSavedBlogsState>(
      listener: (context, state) {
        if (state is UserSavedBlogsFailure) {
          showToast(state.errMessage, context);
        }
      },
      builder: (context, state) {
        if (state is GetUserSavedBlogsSuccess) {
          return GestureDetector(
            onTap: () {
              final userId =
                  (context.read<GetCurrentUserBloc>().state as GetUserSuccess)
                      .user
                      .id;
              context
                  .read<UserSavedBlogsBloc>()
                  .add(ToggleSavedBlogEvent(userId: userId, blogId: blog.id));
            },
            child: state.savedBlogs
                    .map((savedBlog) => savedBlog.id)
                    .contains(blog.id)
                ? const Icon(Icons.bookmark)
                : const Icon(Icons.bookmark_add_outlined),
          );
        }
        return const Icon(Icons.bookmark_add_outlined);
      },
    );
  }
}
