import 'package:flutter/material.dart';
import 'dart:async';

import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/models/auth/view/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  const LoginScreen()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashIcon), 
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            'Logo',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}