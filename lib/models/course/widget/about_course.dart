import 'package:flutter/material.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';

class AboutCourse extends StatelessWidget {
  const AboutCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(text: "Topic Of Video Series"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
