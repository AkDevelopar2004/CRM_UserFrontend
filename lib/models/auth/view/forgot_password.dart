import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constant/app_colors.dart';
import '../../../common/constant/app_images.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/custom_dropdown_widget.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../utils/navigation/app_routes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                text: "Forgot Password",
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
            const SizedBox(height: 150),
            const TextWidget(
              text: 'Mobile/Email',
              color: AppColors.blackColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 4),
            const TextFormFieldWidget(
              hintText: "Enter mobile or email ",
            ),
            const SizedBox(height: 20),
            ButtonWidget(
              borderRadius: 20,
              backgroundColor: AppColors.blueColor,
              onClick: () {
                context.push(AppRoutes.verifyOtp);
              },
              text: 'Send OTP',
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
