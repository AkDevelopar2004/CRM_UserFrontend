import 'package:flutter/material.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import '../../../common/constant/app_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AppImages.loginImg,
            fit: BoxFit.cover,
          ),
          
        ],
      ),
    );
  }
}
