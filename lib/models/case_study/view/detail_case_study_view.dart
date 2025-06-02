import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/sizedbox_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import 'package:user_side_team_frontend/models/case_study/view/case_study_view.dart';

import '../../../common/widgets/button_widget.dart';

class DetailCaseStudyView extends StatelessWidget {
  const DetailCaseStudyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(AppIcons.backArrowIcon)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        AppImages.caseStudyImg,
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextWidget(
                        text: "Title of the Case Study",
                        color: AppColors.darkColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBoxWidget(
                      height: 20,
                    ),
                    const TextWidget(
                      text: "Description",
                      color: AppColors.darkColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextWidget(
                        text:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500sv",
                        color: AppColors.semiDarkColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                AppImages.caseStudyImg,
                                height: 115,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBoxWidget(
                            width: 20,
                          ),
                          Expanded(
                            flex: 5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                AppImages.caseStudyImg,
                                height: 115,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextWidget(
                        text:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500sv",
                        color: AppColors.semiDarkColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextWidget(
                        text:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500sv",
                        color: AppColors.semiDarkColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          AppImages.caseStudyImg,
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextWidget(
                        text:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500sv",
                        color: AppColors.semiDarkColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                        color: AppColors.lightGrayColor,
                      ),
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
                    ),
                    SizedBoxWidget(height: 10,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
