import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/sizedbox_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import 'package:user_side_team_frontend/models/notification/notification_detail_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // context.read<NotificationCubit>().getAllNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: false,
          excludeHeaderSemantics: false,
          leading: InkWell(
              onTap: () {
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
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailNotificationScreen(),
                    ));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Container(
                  height: 66,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: AppColors.whiteColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(AppIcons.messageQusIcon),
                            )),
                        const SizedBoxWidget(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Questions",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                            ),
                            TextWidget(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing",
                              textOverflow: TextOverflow.ellipsis,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.semiDarkColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        //     return const SizedBox.shrink();
        //   }
        // ),
      ),
    );
  }
}
