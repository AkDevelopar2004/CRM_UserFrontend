import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';

class SendReferenceView extends StatelessWidget {
  const SendReferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        clipBehavior: Clip.none,
        elevation: 0,
        titleSpacing: 0,
        // excludeHeaderSemantics: false,
        forceMaterialTransparency: false,

        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
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
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: TextWidget(
                text: "Send the reference link of any website, app or software",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(AppIcons.internetImgIcon)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              TextWidget(text: "Share it with your team"),
              SizedBox(height: 8),
              TextWidget(text: "We'll send you an email with the link"),
              SizedBox(height: 8),
              TextWidget(
                  text:
                      "Once the link is sent, you'll receive a confirmation email"),
              SizedBox(height: 8),
              TextWidget(text: "Click on the link to open the website"),
              SizedBox(height: 8),
              TextWidget(text: "Enjoy your new website!"),
              SizedBox(height: 8),
              TextWidget(
                  text: "Please note that this link is valid for 24 hours"),
              SizedBox(height: 8),
              TextWidget(
                  text:
                      "If you need any further assistance, please let us know"),
              SizedBox(height: 8),
              TextWidget(text: "Thank you for using Readymade!"),
            ],
          )
        ],
      ),
    );
  }
}
