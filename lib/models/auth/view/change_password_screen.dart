import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/constant/app_colors.dart';
import '../../../common/constant/app_images.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/custom_dropdown_widget.dart';
import '../../../common/widgets/text_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        clipBehavior: Clip.none,
        elevation: 0,
        titleSpacing: 0,
        forceMaterialTransparency: false,
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: SvgPicture.asset(AppIcons.backArrowIcon),
              ),
              const TextWidget(
                text: "Change Password",
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                        text: 'New password',
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    const SizedBox(height: 8),
                    const TextFormFieldWidget(
                      hintText: "Enter new password",
                      isPassword: true,
                    ),
                    const SizedBox(height: 16),
                    const TextWidget(
                        text: 'Confirm password',
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    const TextFormFieldWidget(
                      hintText: "Confirm your new password",
                      isPassword: true,
                    ),
                    const SizedBox(height: 40),
                    ButtonWidget(
                      borderRadius: 20,
                      backgroundColor: AppColors.blueColor,
                      onClick: () {
                        _showPasswordChangedDialog(context);
                      },
                      text: 'Change Password',
                      textColor: Colors.white,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

void _showPasswordChangedDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Password has\nChanged",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            Image.asset(
              AppImages.checkImg,
              fit: BoxFit.cover,
            ),
            // Container(
            //   height: 60,
            //   width: 60,
            //   decoration: const BoxDecoration(
            //     color: Color(0xFF7C4DFF), // purple-like color
            //     shape: BoxShape.circle,
            //   ),
            //   child: const Icon(Icons.check, color: Colors.white, size: 32),
            // ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                print("Login tapped");
                // Optionally navigate to login screen
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7C4DFF),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 80,
              height: 36,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // close dialog
                },
                child: const Text("OK"),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
