import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/images.dart';
import 'package:sgr_unity/core/utils/widgets/custom_loader.dart';
import 'package:sgr_unity/core/utils/widgets/custom_toast.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/user_saved_blogs/user_saved_blogs_bloc.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_card.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';
import 'package:sgr_unity/generated/l10n.dart';

class SavedViewBlogsBody extends StatelessWidget {
  const SavedViewBlogsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocConsumer<UserSavedBlogsBloc, UserSavedBlogsState>(
        listener: (context, state) {
          if (state is UserSavedBlogsFailure) {
            showToast(state.errMessage, context);
          }
        },
        builder: (context, state) {
          if (state is UserSavedBlogsLoading) {
            return const Center(
              child: CustomLoader(),
            );
          } else if (state is GetUserSavedBlogsSuccess) {
            if (state.savedBlogs.isEmpty) {
              return Center(
                  child: SvgPicture.asset(Assets.imagesEmptyListImage2));
            }
            return RefreshIndicator(
              color: AppPallete.gradient1,
              onRefresh: () async {
                final userId =
                    (context.read<GetCurrentUserBloc>().state as GetUserSuccess)
                        .user
                        .id;
                context
                    .read<UserSavedBlogsBloc>()
                    .add(GetUserSavedBlogsEvent(userId));
              },
              child: ListView.builder(
                  itemCount: state.savedBlogs.length,
                  itemBuilder: (context, index) {
                    final savedBlogs = state.savedBlogs.reversed.toList();
                    final blog = savedBlogs[index];
                    return CustomBlogCard(blog: blog);
                  }),
            );
          }
          return Center(child: Text(S.of(context).Somethingwentwrong));
        },
      ),
    );
  }
}
