import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constant/app_colors.dart';
import '../../../common/constant/app_images.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/custom_dropdown_widget.dart';
import '../../../common/widgets/text_widget.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        clipBehavior: Clip.none,
        elevation: 0,
        titleSpacing: 0,
        // excludeHeaderSemantics: false,
        forceMaterialTransparency: false,

        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(AppIcons.backArrowIcon)),
              const TextWidget(
                text: "Verify OTP",
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
          ],
        ),
      ),
    );

  }
}