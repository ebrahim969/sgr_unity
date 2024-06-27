import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';

void customDialog(
    {required BuildContext context,
    String? title,
    required String desc,
    required Function()? ok}) {
  QuickAlert.show(
    backgroundColor: AppPallete.darkBackgroundColor,
    confirmBtnColor: AppPallete.errorColor,
    showCancelBtn: true,
    context: context,
    type: QuickAlertType.warning,
    titleColor: AppPallete.whiteColor,
    title: 'Delete Blog',
    text: desc,
    textColor: AppPallete.greyColor,
    confirmBtnText: 'Delete',
    onConfirmBtnTap: ok,
  );
}
