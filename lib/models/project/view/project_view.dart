// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/filter_popup_widget.dart';
import 'package:user_side_team_frontend/common/widgets/primary_button.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import 'package:user_side_team_frontend/utils/navigation/app_router.dart';
import 'package:user_side_team_frontend/utils/navigation/app_routes.dart';

class ProjectView extends StatelessWidget {
  ProjectView({super.key});

  List<String> categoryLabel = ['App Demo', 'Admin Demo', 'Download app'];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextWidget(
                    text: "Projects",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      // void showFiltersPopup(BuildContext context) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FiltersPopup();
                        },
                      );
                      // }
                    },
                    child: SvgPicture.asset(
                      AppIcons.filterIcon,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.readymadeProject);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.1), // Shadow color with opacity
                            spreadRadius: 2, // Spread of the shadow
                            blurRadius:
                                5, // Blur radius for softening the shadow
                            offset: const Offset(0,
                                3), // Horizontal and vertical shadow position
                          ),
                        ],
                      ),
                      height: 57,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.redymadeIcon,
                            color: AppColors.primarySkyColor,
                          ),
                          const TextWidget(
                            text: "Readymade",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.semiDarkColor,
                          )
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          context.push(AppRoutes.sendReferenceView);
                        },
                        child: Container(
                                            decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.1), // Shadow color with opacity
                            spreadRadius: 2, // Spread of the shadow
                            blurRadius: 5, // Blur radius for softening the shadow
                            offset: const Offset(
                                0, 3), // Horizontal and vertical shadow position
                          ),
                        ],
                                            ),
                                            height: 57,
                                            child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.sendReferencesIcon,
                            color: AppColors.primarySkyColor,
                          ),
                          const TextWidget(
                            text: "Send Reference",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.semiDarkColor,
                          )
                        ],
                                            ),
                                          ),
                      ))
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 196,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AppImages.projectImg),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              right: 15,
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.blueColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Text(
                                      "Build Project Now",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const TextWidget(
                          text: "Project Name",
                          color: AppColors.darkColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 7.0),
                          child: TextWidget(
                            text: "E-commerce",
                            color: AppColors.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Wrap(
                            spacing: 10.0,
                            runSpacing: 7.0,
                            children: categoryLabel
                                .map((e) =>
                                    PrimaryButton(text: e, isDark: false))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
