import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:flutter/material.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/widgets/custom_fancy_shimmer_image.dart';
import 'package:sgr_unity/core/utils/widgets/custom_toast.dart';
import 'package:sgr_unity/core/utils/widgets/pop_menu_widget.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/blog_bloc/blog_bloc.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';
import 'package:sgr_unity/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class CustomBlogUserInfo extends StatelessWidget {
  const CustomBlogUserInfo({
    super.key,
    required this.blog,
  });

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    final txt = S.of(context);
    return BlocBuilder<GetCurrentUserBloc, GetUsersState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return GestureDetector(
            onTap: () {
              blog.posterId != state.user.id
                  ? customNavigate(context, '/AnyUserProfileView', extra: blog)
                  : null;
            },
            child: Row(
              children: [
                blog.posterAvatar != null
                    ? ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: CustomFancyShimmerImage(
                          height: 30,
                          width: 30,
                          image: blog.posterAvatar,
                        ))
                    : const CircleAvatar(
                        radius: 15,
                        backgroundColor: AppPallete.whiteColor,
                        child: Center(
                          child: Icon(Icons.person),
                        ),
                      ),
                SizedBox(
                  width: 8.w,
                ),
                Text(blog.posterName ?? ''),
                const Spacer(),
                blog.posterId == state.user.id
                    ? BlocListener<BlogBloc, BlogState>(
                        listener: (context, state) {
                          if (state is DeleteBlogSuccess) {
                            showToast(txt.Blogdeletedsuccessfully, context,
                                type: ToastificationType.success);
                            customReplacementNavigate(
                                context, '/MainScreenView');
                          } else if (state is BlogFailure) {
                            showToast(
                              txt.Somethingwentwrong,
                              context,
                            );
                          }
                        },
                        child: PopUpMenueWidget(
                          blog: blog,
                          txt: txt,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
