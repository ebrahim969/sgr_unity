import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/images.dart';
import 'package:sgr_unity/core/utils/widgets/custom_toast.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_card.dart';
import 'package:sgr_unity/features/search/presentation/bloc/search_bloc.dart';

class CustomSearchViewBody extends StatelessWidget {
  const CustomSearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchFailure) {
          showToast(state.errMessage, context);
        }
      },
      builder: (context, state) {
        if (state is SearchLoading) {
          const CircularProgressIndicator(
            color: AppPallete.gradient1,
          );
        } else if (state is SearchSuccess) {
          if (state.blogs.isEmpty) {
            return SvgPicture.asset(
              Assets.imagesEmptyListImage,
            );
          } else {
            return ListView.builder(
              itemCount: state.blogs.length,
              itemBuilder: ((context, index) {
                return CustomBlogCard(blog: state.blogs[index]);
              }),
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}
