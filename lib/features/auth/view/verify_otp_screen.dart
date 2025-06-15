import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/utils/navigation/app_routes.dart';
import '../../../common/constant/app_colors.dart';
import '../../../common/constant/app_images.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_widget.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _otpControllers = List.generate(4, (_) => TextEditingController());
  final _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  Widget _buildOtpField(int index) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        controller: _otpControllers[index],
        focusNode: _focusNodes[index],
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
      ),
    );
  }

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
                text: "Verify OTP",
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
                children: [
                  const TextWidget(
                    text: "Enter OTP sent to mobile number",
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                   const TextWidget(
                    text: "xxxxxx1234",
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 16),
                  InkWell(
  onTap: () {
    // Add your logic here
    print("Change mobile number tapped");
  },
  child: TextWidget(
    text: "Change mobile number",
    color: AppColors.blueColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    textDecoration: TextDecoration.underline, // 👈 underline added
  ),
),

                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, _buildOtpField),
                  ),
                  const SizedBox(height: 32),
                  // ButtonWidget(
                  //   text: "Verify",
                  //   onClick: () {
                  //     final otp = _otpControllers.map((c) => c.text).join();
                  //     // Add your OTP validation logic here
                  //     print("Entered OTP: $otp");
                  //   },
                  // ),
                    ButtonWidget(
                  borderRadius: 20,
                  backgroundColor: AppColors.blueColor,
                  onClick: () {
                    // context.go('/home-screen');
                    context.push(AppRoutes.changePassword);
                  },
                  text: 'Verify Otp',
                  textColor: Colors.white,
                ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}