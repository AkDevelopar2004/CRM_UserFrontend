import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/constant/app_colors.dart';
import '../../../common/constant/app_images.dart';
import '../../../common/widgets/filter_popup_widget.dart';
import '../../../common/widgets/text_widget.dart';

class CourseHorizontalSection extends StatelessWidget {
  const CourseHorizontalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                text: "Courses",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.darkColor,
              ),
              GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FiltersPopup();
                      },
                    );
                  },
                  child: SvgPicture.asset(
                    AppIcons.filterIcon,
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: const [
              CourseHorizontalCard(
                title: "Video Series",
                count: 12,
                color: Color(0xFF6366F1),
                icon: Icons.play_circle_outline,
              ),
              CourseHorizontalCard(
                title: "Quiz",
                count: 8,
                color: Color(0xFFFBBF24),
                icon: Icons.lightbulb_outline,
              ),
              CourseHorizontalCard(
                title: "Results",
                count: 15,
                color: Color(0xFF8B5CF6),
                icon: Icons.check_circle_outline,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CourseHorizontalCard extends StatelessWidget {
  final String? title;
  final int? count;
  final Color? color;
  final IconData? icon;

  const CourseHorizontalCard({
    super.key,
    this.title,
    this.count,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 80,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color ?? Colors.grey,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon ?? Icons.info,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title ?? "Title",
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
