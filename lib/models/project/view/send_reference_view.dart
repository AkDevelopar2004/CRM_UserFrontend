import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import '../../../common/widgets/button_widget.dart';

class SendReferenceView extends StatelessWidget {
  const SendReferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: SvgPicture.asset(AppIcons.backArrowIcon),
              ),
              const TextWidget(
                text: "Send Reference",
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(width: 20), // Placeholder for alignment
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: TextWidget(
                  text:
                      "Send the reference link of any website, app or software",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(AppIcons.internetImgIcon),
              ),
              const SizedBox(height: 24),
              const TextWidget(text: 'Name'),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextWidget(text: 'Mobile'),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Mobile number",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextWidget(text: 'Email'),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter mobile number",
                ),
              ),
              const SizedBox(height: 16),
              const TextWidget(text: 'Enter link or URL'),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                borderRadius: 20,
                backgroundColor: AppColors.blueColor,
                onClick: () {
                  // Submit logic here
                },
                text: 'Submit',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
