import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/sizedbox_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import 'package:user_side_team_frontend/models/notification/notification_detail_screen.dart';

class ServicesTakenScreen extends StatefulWidget {
  const ServicesTakenScreen({super.key});

  @override
  State<ServicesTakenScreen> createState() => _ServicesTakenScreenState();
}

class _ServicesTakenScreenState extends State<ServicesTakenScreen> {
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
          toolbarHeight: 80,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(AppIcons.backArrowIcon)),
          centerTitle: true,
          title: const TextWidget(
            text: "Services Taken",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: AppColors.whiteColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(79, 229, 217, 1),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(AppImages.webImg),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: "Service Name",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor,
                                ),
                                TextWidget(
                                  text: "Valid till:- 24 November 2025",
                                  textOverflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.semiDarkColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Expanded(
                          child: Text(
                            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                            "when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.semiDarkColor,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),

       
      ),
    );
  }
}
