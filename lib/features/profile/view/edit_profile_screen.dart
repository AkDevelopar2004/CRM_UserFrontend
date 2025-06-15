import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/constant/app_images.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../common/constant/app_colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        clipBehavior: Clip.none,
        elevation: 0,
        titleSpacing: 0,
        forceMaterialTransparency: false,
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: SvgPicture.asset(AppIcons.backArrowIcon),
              ),
              const TextWidget(
                text: "Edit Profile",
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              SizedBox(
                height: 100,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: -40,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF6C63FF),
                            width: 4,
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Color(0xFF6C63FF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const TextWidget(text: 'Full Name'),
              // const SizedBox(height: 4),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                ),
              ),
              const SizedBox(height: 10),
              const TextWidget(text: 'Email'),
              // const SizedBox(height: 4),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter email id",
                ),
              ),
              const SizedBox(height: 10),
              const TextWidget(text: 'Phone Number'),
              // const SizedBox(height: 8÷),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter mobile number",
                ),
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                borderRadius: 20,
                backgroundColor: AppColors.blueColor,
                onClick: () {
                  // Save changes logic
                  _showPasswordChangedDialog(context);
                },
                text: 'Update',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showPasswordChangedDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Profile has been \n Updated",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            Image.asset(
              AppImages.checkImg,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 80,
              height: 36,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // close dialog
                },
                child: const Text("OK"),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
