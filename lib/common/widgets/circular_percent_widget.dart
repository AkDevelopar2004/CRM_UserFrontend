
import 'package:flutter/material.dart';

class CircularProgressBar extends StatelessWidget {
  final double percentage;

  const CircularProgressBar({Key? key, required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer circular track
        SizedBox(
          width: 90,
          height: 90,
          child: CircularProgressIndicator(
            value:1.0, // Full circle for background
            strokeWidth: 12.0,
            backgroundColor: Colors.orange.shade100,
            valueColor: AlwaysStoppedAnimation(Colors.transparent),
          ),
        ),
        // Progress indicator
        SizedBox(
          width: 90,
          height: 90,
          child: CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: 12.0,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(Colors.orange),
          ),
        ),
        // Percentage text
        Text(
          "${percentage.toInt()}%",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}