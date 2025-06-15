import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/constant/app_colors.dart';

class ThemeController extends GetxController {
  final GetStorage _storage = GetStorage();
  final String _themeKey = 'selectedTheme';
  final String themeId = 'themeColorUpdate';

  Color selectedThemeColor = AppColors.blueColor; // Default sky blue

  @override
  void onInit() {
    super.onInit();
    int? storedColor = _storage.read(_themeKey);
    if (storedColor != null) {
      selectedThemeColor = Color(storedColor);
    }
  }

  void updateTheme(Color color) {
    selectedThemeColor = color;
    _storage.write(_themeKey, color.value);
    update([themeId]);
  }
}
