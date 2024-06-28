import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sgr_unity/core/utils/images.dart';
import 'package:sgr_unity/core/utils/widgets/custom_toast.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_card.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_loading_blog_card.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_any_user_blogs/get_any_user_blogs_bloc.dart';

class CustomAnyUserProfileBlogs extends StatefulWidget {
  const CustomAnyUserProfileBlogs({super.key, required this.userId});

  final String userId;

  @override
  State<CustomAnyUserProfileBlogs> createState() =>
      _CustomAnyUserProfileBlogsState();
}

class _CustomAnyUserProfileBlogsState extends State<CustomAnyUserProfileBlogs> {
  @override
  void initState() {
    context
        .read<GetAnyUserBlogsBloc>()
        .add(EventGetAnyUserBlogs(widget.userId));
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
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CustomLoadingBlogCard();
              });
        } else if (state is GetAnyUserBlogsSuccess) {
          if (state.blogs.isEmpty) {
            return Center(
              child: SvgPicture.asset(Assets.imagesEmptyListImage2),
            );
          } else {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.blogs.length,
              itemBuilder: ((context, index) {
                return CustomBlogCard(blog: state.blogs[index]);
              }),
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
