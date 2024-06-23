import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';

class JoinToUnityWidget extends StatelessWidget {
  const JoinToUnityWidget({
    super.key,
    required this.txt,
  });

  final String txt;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            const Icon(Icons.post_add),
            SizedBox(
              width: 8.w,
            ),
            Text('SGR Unity',
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.gradient3)),
          ],
        )
      ],
    );
  }
}
