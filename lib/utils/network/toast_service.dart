import 'package:flutter/material.dart';

import '../../common/constant/app_colors.dart';
import '../../common/constant/app_images.dart';
import '../../common/constant/local_storageKey.dart';
import '../widget/custom_toast_widget.dart';

class ToastServices {
  ToastServices._();

  static void showToast({
    required String title,
    required String message,
    required Color backgroundColor,
    required Color textColor,
    required Color bubbleColor,
    String? leadingIcon,
    String? trailingIcon,
    Duration duration = const Duration(seconds: 1),
  }) {
    if (LocalStorageKeyStrings.appNavKey.currentContext != null) {
      ScaffoldMessenger.of(LocalStorageKeyStrings.appNavKey.currentContext!)
          .showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          elevation: 20.0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: Colors.transparent,
          content: CustomToastWidget(
            title: title,
            message: message,
            backgroundColor: backgroundColor,
            textColor: textColor,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            bubbleColor: bubbleColor,
          ),
          duration: duration,
        ),
      );
    }
  }

  static void success(String title, String message) {
    showToast(
        title: title,
        message: message,
        backgroundColor: AppColors.successToastBgColor1,
        textColor: AppColors.whiteColor,
        leadingIcon: AppImages.successToastIcon,
        trailingIcon: AppImages.unionCancleIcon,
        bubbleColor: AppColors.successBubbleColor);
  }

  static void error(String title, String message) {
    showToast(
        title: title,
        message: message,
        backgroundColor: AppColors.errorToastBgColor1,
        textColor: AppColors.whiteColor,
        leadingIcon: AppImages.errorToastIcon,
        trailingIcon: AppImages.unionCancleIcon,
        bubbleColor: AppColors.errorBubbleColor);
  }

  static void warning(String title, String message) {
    showToast(
      title: title,
      message: message,
      backgroundColor: AppColors.warningToastBgColor,
      textColor: Colors.white,
      bubbleColor: AppColors.warningBubbleColor,
      leadingIcon: AppImages.warningToastIcon,
    );
  }

  static void message(String title, String message) {
    showToast(
      title: title,
      message: message,
      backgroundColor: AppColors.messageToastBgColor,
      textColor: Colors.white,
      bubbleColor: AppColors.messageBubbleColor,
      leadingIcon: AppImages.messageToastIcon,
    );
  }
}
