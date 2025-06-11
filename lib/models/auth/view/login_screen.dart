import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/widgets/button_widget.dart';
import 'package:user_side_team_frontend/common/widgets/custom_dropdown_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import 'package:user_side_team_frontend/utils/navigation/app_routes.dart';
import '../../../common/constant/app_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            // Uncomment and provide the appropriate image asset
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
                  text: "Login",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                const TextWidget(text: 'Email'),
                const SizedBox(height: 8),
                const TextFormFieldWidget(
                  hintText: "Your email ID",
                ),
                const SizedBox(height: 20),
                const TextWidget(text: 'Password'),
                const SizedBox(height: 8),
                const TextFormFieldWidget(
                  hintText: "Enter your password",
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      context.push(AppRoutes.forgotPassword);
                    },
                    child: TextWidget(
                      text: 'Forgot Password?',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  borderRadius: 20,
                  backgroundColor: AppColors.blueColor,
                  onClick: () {
                    context.go('/home-screen');
                  },
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
                        onPressed: () {
                          context.push(AppRoutes.signupScreen);
                        },
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
    );
  }
}
