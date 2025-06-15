// Function to show a loading dialog
import 'package:flutter/material.dart';

import '../../common/constant/local_storageKey.dart';
import 'app_lottie_loader.dart';



void showLoadingDialog() {
  showDialog(
      context: LocalStorageKeyStrings.appNavKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: AppLottieLoader());
      });
}

hideLoadingDialog() {
  Navigator.pop(LocalStorageKeyStrings.appNavKey.currentContext!);
}
