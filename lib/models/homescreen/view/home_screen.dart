import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/button_widget.dart';
import 'package:user_side_team_frontend/common/widgets/custom_dropdown_widget.dart';
import 'package:user_side_team_frontend/common/widgets/sizedbox_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import 'package:user_side_team_frontend/utils/navigation/app_router.dart';
import 'package:user_side_team_frontend/utils/navigation/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          _headerWidget(context),
          const SizedBoxWidget(
            height: 10,
          ),
          // TextFormFieldWidget(
          //   height: 55,
          //   hintText: "Topic, tag or Tech",
          //   rounded: 30,
          //   prefixIcon: SvgPicture.asset(AppIcons.searchIcon),
          // ),
          // _topTagAndTech(),
        ],
      ),
    );
  }

  _headerWidget(BuildContext context) {
    return Row(
      children: [
        const SizedBoxWidget(
          height: 55,
          width: 55,
          child: CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage(AppImages.profileImage),
          ),
        ),
        const SizedBoxWidget(
          width: 10,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "Welcome",
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
            TextWidget(
              text: "Nitish Tao",
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.primarySkyColor,
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
            onTap: () {
              context.push(AppRoutes.notification);
            },
            child: SvgPicture.asset(AppIcons.notificationIcon))
      ],
    );
  }

  _topTagAndTech() {
    return Wrap(
      spacing: 10,
      children: [
        Row(children: [
          ...List.generate(
          3,
          (index) {
            return ButtonWidget(
              width: 5,
              showPreIcon: true,
              iconImg: AppIcons.bookIcon,
              onClick: () {},
              text: 'Flutter',
            );
          },
        )
        ],)
        
      ],
    );
  }
}
