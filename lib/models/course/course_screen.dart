import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/models/course/widget/course_card.dart';
import 'package:user_side_team_frontend/models/course/widget/course_horizantal_card.dart';

import '../../utils/navigation/app_routes.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: CourseHorizontalSection(),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    context.push(
                      AppRoutes.aboutCourse,
                    );
                  },
                  child: const Column(
                    children: [
                      CourseCard(
                        title: "Flutter",
                        subtitle: "Developing Mobile Application\nwith Flutter",
                        duration: "12 mins",
                        category: "Development",
                        originalPrice: "₹ 2999",
                        discountedPrice: "₹ 299",
                        imageAsset: "assets/images/flutter_3d.png",
                      ),
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
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
