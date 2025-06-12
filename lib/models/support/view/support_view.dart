import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/widgets/sizedbox_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/constant/app_images.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: false,
        excludeHeaderSemantics: false,
        toolbarHeight: 80,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(AppIcons.backArrowIcon)),
        centerTitle: true,
        title: const TextWidget(
          text: "Support",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final Uri phoneUri =
                              Uri(scheme: 'tel', path: '+917679463648');
                          if (await canLaunchUrl(phoneUri)) {
                            await launchUrl(phoneUri);
                          } else {
                            print('Could not launch phone dialer');
                          }
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.phone,
                            color: AppColors.blueColor,
                          ),
                        ),
                      ),
                      const SizedBoxWidget(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "Our 24x7 Customer Support",
                            fontSize: 12,
                          ),
                          SizedBoxWidget(height: 5),
                          Text(
                            '+91 7679463648',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blueColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBoxWidget(height: 12),

                // Email Support Card
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.email_outlined,
                          color: AppColors.blueColor,
                        ),
                      ),
                      SizedBoxWidget(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "Write us at",
                            fontSize: 12,
                          ),
                          SizedBoxWidget(height: 5),
                          TextWidget(
                            text: "user@email.com",
                            fontWeight: FontWeight.bold,
                            color: AppColors.blueColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: TextWidget(
              text: "Frequently Asked Questions",
              fontSize: 12,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: const Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    iconColor: Colors.grey[600],
                    collapsedIconColor: Colors.grey[600],
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextWidget(
                          text:
                              "Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          fontSize: 12,
                          color: Colors.grey[700],
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
