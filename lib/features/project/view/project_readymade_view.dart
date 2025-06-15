import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/filter_popup_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import 'package:user_side_team_frontend/utils/navigation/app_router.dart';

class ProjectReadymadeView extends StatelessWidget {
  const ProjectReadymadeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          clipBehavior: Clip.none,
          elevation: 0,
          titleSpacing: 0,
          // excludeHeaderSemantics: false,
          forceMaterialTransparency: false,

          title: Padding(
              padding: const EdgeInsets.only(right:  8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(AppIcons.backArrowIcon)),
                  const TextWidget(
                    text: "Readymade",
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: (){
                         showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return FiltersPopup();
                            },
                          );
                    },
                    child: SvgPicture.asset(AppIcons.filterIcon, fit: BoxFit.cover,))
                ],
              ),
            ), 
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Image.asset(AppImages.projectImg, width: double.infinity, height: 196,),
              SizedBox(height: 3,),
              TextWidget(
                text: "Project Name",
                fontSize: 16, fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
              SizedBox(height: 3,),
              TextWidget(
                text: "E-commerce",
                fontSize: 12, fontWeight: FontWeight.w500,
                color: AppColors.greyColor,
              ),
                          
            ],),
          );
        },),
      ),
    );
  }
}
