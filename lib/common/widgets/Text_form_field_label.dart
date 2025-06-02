import 'package:flutter/material.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';

class TextFormFieldLabel extends StatelessWidget {
  const TextFormFieldLabel({
    super.key,
    this.controller,
    this.hintText,
    this.headingText,
  });

  final TextEditingController? controller;
  final String? headingText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: headingText ?? '--',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.semiDarkColor,
        ),
        SizedBox.shrink(),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero, // Removes extra padding
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              color: AppColors.textGrey,
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: const Color.fromARGB(255, 223, 219, 219)),
            ),
            enabledBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color: const Color.fromARGB(255, 223, 219, 219)),
            ),
          ),
        ),
      ],
    );
  }
}
