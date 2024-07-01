import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/generated/l10n.dart';

import 'package:toastification/toastification.dart';

showToast(String msg, BuildContext context, {ToastificationType? type}) {
  toastification.show(
    context: context,
    type: type ?? ToastificationType.error,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 3),
    title: Text(type == ToastificationType.success? S.of(context).success :type == ToastificationType.info? S.of(context).Info :S.of(context).warning),
    description: Text(msg),
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: const Icon(Icons.close),
    primaryColor:type == ToastificationType.error? Colors.red :Colors.green,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: type == ToastificationType.error? AppPallete.errorColor :Colors.green),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}
