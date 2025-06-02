import 'package:flutter/material.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Center(
            // child: Image.asset(
            //   AppImages.loginImg,
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 15,
                blurRadius: 30,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: TextWidget(text: "text"),
        )
      ],
    ));
  }
}
