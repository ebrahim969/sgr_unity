import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/widgets/custom_fancy_shimmer_image.dart';
import 'package:sgr_unity/features/profile/presentation/widgets/custom_follow_and_message_btn.dart';
import 'package:sgr_unity/generated/l10n.dart';

class CustomUserInformationsSection extends StatelessWidget {
  const CustomUserInformationsSection(
      {super.key, required this.user, required this.isCurrentUser});
  final UserEntity user;
  final bool isCurrentUser;
  @override
  Widget build(BuildContext context) {
    final txt = S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: user.profileAvatar != null
                    ? CustomFancyShimmerImage(
                        image: user.profileAvatar,
                        height: 70,
                        width: 70,
                      )
                    : const Center(
                        child: Icon(Icons.person),
                      ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Text(
                "0 ${txt.Followers}",
                style: const TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 8.w,
              ),
              Container(
                height: 20.h,
                width: 2.w,
                color: AppPallete.greyColor,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "0 ${txt.Following}",
                style: const TextStyle(fontSize: 14),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user.name,
                style: TextStyle(fontSize: 20.sp, color: AppPallete.greyColor),
              ),
              isCurrentUser
                  ? GestureDetector(
                      onTap: () {
                        customNavigate(context, '/UpdateUserProfileView',
                            extra: user);
                      },
                      child: Chip(
                        label: Text(txt.EditYourProfile),
                        side:
                            const BorderSide(color: AppPallete.borderDarkColor),
                      ),
                    )
                  : const CustomFollowAndMessageBtn()
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(user.shortBio ?? ''),
          SizedBox(
            height: 8.h,
          ),
          const Divider()
        ],
      ),
    );
  }
}
