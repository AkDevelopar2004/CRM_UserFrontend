import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/sizedbox_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';

class DetailNotificationScreen extends StatelessWidget {
  
  const DetailNotificationScreen({super.key, this.title, this.subtitle});
   final String? title;
   final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: false,
            excludeHeaderSemantics: false,
            leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: SvgPicture.asset(AppIcons.backArrowIcon)),
            centerTitle: true,
            title: const TextWidget(
              text: "Notification",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBoxWidget(
                  height: 20,
                ),
                Center(
                  child: Container(
                      height: 95,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.faintSkyColor),
                      child: SvgPicture.asset(AppIcons.messageQusIcon)),
                ),
                const SizedBoxWidget(
                  height: 25,
                ),
                 TextWidget(
                  text: title ?? "--",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                 const SizedBoxWidget(
                  height: 7,
                 ),
                 TextWidget(
                  text: subtitle ??"--",
                     fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkColor,
                )
              ],
            ),
          )),
    );
  }
}
