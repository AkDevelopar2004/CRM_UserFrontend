import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/common/widgets/primary_button.dart';
import 'package:user_side_team_frontend/common/widgets/sizedbox_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';

class FiltersPopup extends StatefulWidget {
  FiltersPopup({super.key});

  @override
  State<FiltersPopup> createState() => _FiltersPopupState();
}

class _FiltersPopupState extends State<FiltersPopup> {
  List<String> categoryLabel = ['App', 'Game', 'Website', 'Admin Panel'];
  String? selectedCategory;

  List<String> subCategoryLabel = [
    'E-commerce',
    'OTT/Streaming',
    'Grocery',
    'Betting',
    'Car Sharing',
    'Hotel Booking',
    'Sports',
    'Ludo',
  ];
  String? selectedSubCategory;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBoxWidget(
                  width: 10,
                ),
                const TextWidget(
                  text: 'Filters',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
                IconButton(
                  icon: SvgPicture.asset(AppIcons.cancelIcon, height: 38,width: 38,),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
            const SizedBoxWidget(height: 12),
            // Category Section
            const TextWidget(
              text: 'Category',
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 7.0,
                children: categoryLabel
                    .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = e;
                          });
                        },
                        child:
                            _buildChip(e, isSelected: selectedCategory == e)))
                    .toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical:5.0),
              child: Divider(
                color: AppColors.lightColor,
              ),
            ),
            // Subcategory Section
            const TextWidget(
              text: 'Subcategory',
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: subCategoryLabel
                    .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSubCategory = e;
                          });
                        },
                        child:
                            _buildChip(e, isSelected: selectedSubCategory == e)))
                    .toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical:5.0),
              child: Divider(
                color: AppColors.lightColor,
              ),
            ),
            // Type Section
          const TextWidget(
              text: 'Type',
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            SizedBox(height:5,),
            Row(
              children: [
                _buildTypeButton('Photos', AppIcons.photoIcon, true),
                const SizedBox(width: 12),
                _buildTypeButton('Videos', AppIcons.videoIcon, false),
              ],
            ),
            const SizedBox(height: 16),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(text: "clear", fontSize: 13, height: 7, width: 14, fontWeight: FontWeight.w500,textcolor: AppColors.primarySkyColor,),
                SizedBoxWidget(width: 7,),
                  PrimaryButton(text: "Apply Filter", fontSize: 13, height: 7, width: 14, fontWeight: FontWeight.w500,isDark: true,),
              
              ],
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String text, {bool? isSelected}) {
    return Container(
        decoration: BoxDecoration(
            color: isSelected!
                ? AppColors.primarySkyColor
                : AppColors.primarySkyColor.withOpacity(0.10),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 9),
          child: TextWidget(
              text: text,
              color:
                  isSelected ? AppColors.lightColor : AppColors.semiDarkColor,
              fontSize: 10,
              fontWeight: FontWeight.w400),
        ));
  }

  Widget _buildTypeButton(String text, String icon, bool isActive) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppColors.primarySkyColor : AppColors.primarySkyColor.withOpacity(0.10),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              color: isActive ? AppColors.lightColor : AppColors.darkColor,
            ),
            TextWidget(
              text:text,
                color:isActive ? AppColors.lightColor : AppColors.darkColor,
                fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
