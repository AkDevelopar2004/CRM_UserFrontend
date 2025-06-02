import 'package:flutter/material.dart';

import '../../../common/constant/app_colors.dart';
import '../../../common/constant/app_images.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/custom_dropdown_widget.dart';
import '../../../common/widgets/text_widget.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AppImages.loginImg,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      text: "Sign Up",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 20),
                    const TextWidget(text: 'Name'),
                    const SizedBox(height: 8),
                    const TextFormFieldWidget(
                      hintText: "Enter your name",
                    ),
                    const SizedBox(height: 20),
                    const TextWidget(text: 'Email'),
                    const SizedBox(height: 8),
                    const TextFormFieldWidget(
                      hintText: "Enter your email ID",
                    ),
                    const SizedBox(height: 20),
                    const TextWidget(text: "Mobile No."),
                    const SizedBox(height: 8),
                    const TextFormFieldWidget(
                      hintText: "Enter your mobile number",
                    ),
                    const SizedBox(height: 20),
                    // const TextWidget(text: 'Password'),
                    // const SizedBox(height: 8),
                    // const TextFormFieldWidget(
                    //   hintText: "Enter your password",
                    //   suffixIcon: Icon(Icons.visibility_off),
                    // ),
                    const TextWidget(text: "Password"),
                    const SizedBox(height: 8),
                    TextFormFieldWidget(
                      hintText: "Enter your password",
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    ButtonWidget(
                      borderRadius: 20,
                      backgroundColor: AppColors.blueColor,
                      onClick: () {},
                      text: 'Login',
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget(text: 'Don\'t have an account?'),
                          TextButton(
                            onPressed: () {},
                            child: const TextWidget(
                              text: 'Sign Up!',
                              color: AppColors.blueColor,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
