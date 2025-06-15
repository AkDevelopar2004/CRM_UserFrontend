import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/button_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import 'package:user_side_team_frontend/features/case_study/widgets/case_view_widget.dart';
import 'package:user_side_team_frontend/common/widgets/filter_popup_widget.dart';
import 'package:user_side_team_frontend/features/homescreen/view/home_screen.dart';
import 'package:user_side_team_frontend/utils/navigation/app_router.dart';
import 'package:user_side_team_frontend/utils/navigation/app_routes.dart';

import '../../../common/constant/app_colors.dart';

class CaseStudyView extends StatelessWidget {
  const CaseStudyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                text: "Case Studies",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.darkColor,
              ),
              GestureDetector(
                onTap: (){
                  showFiltersPopup(context);
                },
                child: SvgPicture.asset(
                  AppIcons.filterIcon,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.detailedCaseStudy);
                      },
                      child: CaseViewWidget()), // Your case study widget
                );
              },
            ),
          )
        ],
      ),
    );
  }
  void showFiltersPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return FiltersPopup();
    },
  );
}
}
