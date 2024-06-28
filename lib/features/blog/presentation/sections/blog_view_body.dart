import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/images.dart';
import 'package:sgr_unity/core/utils/widgets/custom_toast.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/blog_bloc/blog_bloc.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_card.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_loading_blog_card.dart';

class BlogViewBody extends StatefulWidget {
  const BlogViewBody({
    super.key,
    required this.blogEvent,
  });

  final BlogEvent blogEvent;

  @override
  State<BlogViewBody> createState() => _BlogViewBodyState();
}

class _BlogViewBodyState extends State<BlogViewBody> {
  @override
  void initState() {
    context.read<BlogBloc>().add(widget.blogEvent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogBloc, BlogState>(
      listener: (context, state) {
        if (state is BlogFailure) {
          showToast(state.message, context);
        }
      },
      builder: (context, state) {
        if (state is BlogLoading) {
          return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CustomLoadingBlogCard();
              });
        } else if (state is GetAllBlogSuccess) {
          if (state.blogs.isEmpty) {
            return Center(child: SvgPicture.asset(Assets.imagesEmptyListImage));
          } else {
            return RefreshIndicator(
              color: AppPallete.gradient1,
              onRefresh: () async {
                context.read<BlogBloc>().add(widget.blogEvent);
              },
              child: ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) {
                  final blog = state.blogs[index];
                  return CustomBlogCard(
                    blog: blog,
                  );
                },
              ),
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
