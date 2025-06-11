import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/widgets/sizedbox_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import 'package:user_side_team_frontend/models/about_course/about_course_sub_tab/about.dart';
import 'package:user_side_team_frontend/models/about_course/about_course_sub_tab/about_course_sub_tab.dart';
import 'package:user_side_team_frontend/utils/navigation/app_router.dart';
import 'package:user_side_team_frontend/utils/navigation/app_routes.dart';

import '../../../common/constant/app_images.dart';

class AboutCourse extends StatelessWidget {
  const AboutCourse({super.key});

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
                text: "Topic Of Video Series",
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     context.pop();
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.all(8),
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey.shade100,
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     child: SvgPicture.asset(
                  //       AppIcons.backArrowIcon,
                  //       width: 20,
                  //       height: 20,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 16),
                  // const Expanded(
                  //   child: Text(
                  //     "Topic Of Video Series",
                  //     style: TextStyle(
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.black87,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    
                    // Course Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF2D3748),
                            Color(0xFF4A5568),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title section
                          InkWell(
                            onTap: () {
                              context.push(AppRoutes.quizscreen);
                            },
                            child: const Text(
                              "What is New in\nNode.Js",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Subtitle
                          const Text(
                            "Topic of video series",
                            style: TextStyle(
                              color: Color(0xFFB0B8C1),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Duration and category
                          Row(
                            children: [
                              const Text(
                                "34 mins",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 4,
                                height: 4,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFB0B8C1),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Programming",
                                style: TextStyle(
                                  color: Color(0xFFB0B8C1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Progress section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Progress",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "60%",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),

                          // Progress indicator
                          LinearProgressIndicator(
                            value: 0.6,
                            backgroundColor: Colors.grey[800],
                            color: const Color(0xFF667EEA),
                            minHeight: 4,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Course Details
                    const Text(
                      "Topic of the Video Series",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text(
                          "34 Mins",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 4,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Text(
                          "Programming",
                          style: TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // AboutCourseSubTab - This will now be scrollable
                    const AboutCourseSubTab(),
                    
                    const SizedBox(height: 20), // Bottom padding
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}