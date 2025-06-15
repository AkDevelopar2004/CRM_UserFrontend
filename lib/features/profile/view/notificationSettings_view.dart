import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/sizedbox_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';
import 'package:user_side_team_frontend/features/notification/notification_detail_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    // context.read<NotificationCubit>().getAllNotification();
    super.initState();
  }
   bool popupNotification = false;
  bool chatNotification = true;

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
              text: "Invoices",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
           body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildToggleRow("Popup Notification", popupNotification, (val) {
              setState(() {
                popupNotification = val;
              });
            }),
            const Divider(color: Color.fromRGBO(240, 240, 240, 1), thickness: 2),
            _buildToggleRow("Chat Notification", chatNotification, (val) {
              setState(() {
                chatNotification = val;
              });
            }),
          ],
        ),
      ),
      ),
    );}

  Widget _buildToggleRow(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white,
          activeTrackColor: Colors.deepPurple,
        ),
      ],
    );
  }
}