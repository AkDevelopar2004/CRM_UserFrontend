import 'package:flutter/material.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/button_widget.dart';
import 'package:user_side_team_frontend/common/widgets/sizedbox_widget.dart';

import '../../../common/widgets/text_widget.dart';

class CaseViewWidget extends StatelessWidget {
  const CaseViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: AppColors.whiteColor),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Image.asset(AppImages.caseStudyImg, fit: BoxFit.cover,)),
                  const SizedBoxWidget(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200, minHeight: 100),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidget(
                              text: "Title of the case study",
                              color: AppColors.darkColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            const TextWidget(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                              color: AppColors.greyColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            Row(
                              children: [
                                ButtonWidget(
                                  onClick: () {},
                                  height: 23,
                                  width: 7,
                                  text: "App",
                                  borderRadius: 30,
                                  backgroundColor:
                                      AppColors.activeColor.withOpacity(0.2),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                ButtonWidget(
                                  onClick: () {},
                                  height: 23,
                                  width: 7,
                                  text: "Car Sharing",
                                  borderRadius: 30,
                                  backgroundColor:
                                      AppColors.activeColor.withOpacity(0.2),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}