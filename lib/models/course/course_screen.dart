import 'package:flutter/material.dart';
import 'package:user_side_team_frontend/models/course/widget/course_card.dart';
import 'package:user_side_team_frontend/models/course/widget/course_horizantal_card.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CourseHorizontalSection(),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 10),
                CourseCard(
                  title: "Flutter",
                  subtitle: "Developing Mobile Application\nwith Flutter",
                  duration: "12 mins",
                  category: "Development",
                  originalPrice: "₹ 2999",
                  discountedPrice: "₹ 299",
                  imageAsset: "assets/images/flutter_3d.png",
                ),
                SizedBox(height: 10),
                CourseCard(
                  title: "react",
                  subtitle: "react web Application",
                  duration: "45 mins",
                  category: "Development",
                  originalPrice: "₹ 1222",
                  discountedPrice: "₹ 1000",
                  imageAsset: "assets/images/flutter_3d.png",
                ),
                SizedBox(height: 10),
                CourseCard(
                  title: "react",
                  subtitle: "react web Application",
                  duration: "45 mins",
                  category: "Development",
                  originalPrice: "₹ 5222",
                  discountedPrice: "₹ 4000",
                  imageAsset: "assets/images/flutter_3d.png",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
