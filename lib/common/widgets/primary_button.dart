import 'package:flutter/material.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';

import '../constant/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {super.key,
      this.text,
      this.isDark = false,
      this.height = 5,
      this.fontSize = 10,
      this.width = 9,
      this.fontWeight,
      this.textcolor});

  final String? text;
  bool isDark;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: isDark
                ? AppColors.primarySkyColor
                : AppColors.primarySkyColor.withOpacity(0.10),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
          child: TextWidget(
              text: text ?? "---",
              color: isDark ? AppColors.lightColor : textcolor,
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.w400),
        ));
  }
}
