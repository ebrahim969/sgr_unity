import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sgr_unity/core/utils/images.dart';
import 'package:sgr_unity/core/utils/widgets/custom_toast.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_card.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_loading_blog_card.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';

class CustomProfileBlogs extends StatefulWidget {
  const CustomProfileBlogs({
    super.key,
  });

  @override
  State<CustomProfileBlogs> createState() => _CustomProfileBlogsState();
}

class _CustomProfileBlogsState extends State<CustomProfileBlogs> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetUserBlogsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is GetUserBlogsFailure) {
          showToast(state.errMessage, context);
        }
      },
      builder: (context, state) {
        if (state is GetUserBlogsLaoding) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CustomLoadingBlogCard();
              });
        } else if (state is GetUserBlogsSuccess) {
          if (state.blogs.isEmpty) {
            return Center(
              child: SvgPicture.asset(Assets.imagesEmptyListImage),
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
