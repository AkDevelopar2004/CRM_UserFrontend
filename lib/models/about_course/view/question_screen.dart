import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/utils/navigation/app_routes.dart';

import '../../../common/constant/app_colors.dart';
import '../../../common/constant/app_images.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_widget.dart';
import '../controller/quiz_controller.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});
  final QuestionController controller = Get.find<QuestionController>();

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
                text: "Question",
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
      // backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                Row(
                  children: [
                   
                    Obx(() => Text(
                          "Question ${controller.questionIndex + 1}/10",
                          style: const TextStyle(fontSize: 14),
                        )),
                    const Spacer(flex: 2),
                  ],
                ),
                const SizedBox(height: 16),
          
                // Question Text
                const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
          
                // Timer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Time", style: TextStyle(color: Colors.grey)),
                    Obx(() => Text(
                        "00:${controller.timeRemaining.toString().padLeft(2, '0')}")),
                  ],
                ),
                const SizedBox(height: 6),
          
                // Progress Bar
                Obx(() => LinearProgressIndicator(
                      value: controller.timeRemaining.value / 10,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.deepPurple,
                    )),
                const SizedBox(height: 20),
          
                // Options
                Obx(() => Column(
                      children: List.generate(controller.options.length, (index) {
                        return GestureDetector(
                          onTap: () => controller.selectOption(index),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: controller.selectedOption.value == index
                                    ? Colors.deepPurple
                                    : Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.options[index]),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          controller.selectedOption.value == index
                                              ? Colors.deepPurple
                                              : Colors.grey,
                                    ),
                                  ),
                                  child: controller.selectedOption.value == index
                                      ? Center(
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            decoration: const BoxDecoration(
                                              color: Colors.deepPurple,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    )),
                const SizedBox(height: 10),
          
                // Previous & Next Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.previousQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE8DDFF),
                          foregroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back, color: Colors.deepPurple),
                            SizedBox(height: 4),
                            Text(
                              "Previous Question",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE8DDFF),
                          foregroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_forward, color: Colors.deepPurple),
                            SizedBox(height: 4),
                            Text(
                              "Next Question",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          
                const SizedBox(height: 16),
          
                // Submit Button
                Center(
                  child: ButtonWidget(
                    borderRadius: 20,
                    backgroundColor: AppColors.blueColor,
                    onClick: () {},
                    text: 'Submit',
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
          
                // Answers Button
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                    context.push(AppRoutes.congratesScreen);
                    },
                    icon: const Icon(Icons.lightbulb, color: Colors.amber),
                    label: const Text("Answers"),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.deepPurple,
                      backgroundColor: const Color(0xFFE8DDFF),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
