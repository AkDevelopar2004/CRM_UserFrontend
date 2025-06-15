import 'package:flutter/material.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/widgets/sizedbox_widget.dart';
import 'package:user_side_team_frontend/common/widgets/text_widget.dart';

class AboutCourseSubTab extends StatefulWidget {
  const AboutCourseSubTab({super.key});

  @override
  State<AboutCourseSubTab> createState() => _AboutCourseSubTabState();
}

class _AboutCourseSubTabState extends State<AboutCourseSubTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            children: const [
              CourseHorizontalCard(
                title: "2k+ Views",
                icon: Icons.visibility_outlined,
                color: Color(0xFF7C3AED),
              ),
              CourseHorizontalCard(
                title: "3.5 hours",
                icon: Icons.schedule_outlined,
                color: Color(0xFF7C3AED),
              ),
              CourseHorizontalCard(
                title: "Download",
                icon: Icons.file_download_outlined,
                color: Color(0xFF7C3AED),
              ),
            ],
          ),
        ),

        // TabBar
        TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF7C3AED),
          unselectedLabelColor: Colors.grey.shade600,
          indicatorColor: const Color(0xFF7C3AED),
          indicatorWeight: 2,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          tabs: const [
            Tab(text: "About"),
            Tab(text: "Curriculum"),
            Tab(text: "Reviews"),
          ],
        ),

        const SizedBox(height: 16),

        // TabBarView
        SizedBox(
          height: 300,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildAboutTab(),
              _buildCurriculumTab(),
              _buildReviewsTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAboutTab() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/profile_image.png"),
                    ),
                    SizedBoxWidget(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(text: "Name of Author"),
                        SizedBoxWidget(
                          height: 3,
                        ),
                        TextWidget(
                          text: "Designation",
                          color: AppColors.blueColor,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBoxWidget(height: 7),
                TextWidget(
                  text: "About Course",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(
                  text:
                      "Loream epsuem this is a about the course realted information you can search on the google and also you can get good information about the projects and many things so do.",
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF8B5CF6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Enroll Course- ₹ 299',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCurriculumTab() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Column(
              children: List.generate(
                5,
                (index) => Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                        width: 80,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.greenTextColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: "node js",
                            color: AppColors.whiteColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBoxWidget(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Episode name",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBoxWidget(height: 4),
                            TextWidget(
                              text: '18:32 mins',
                              fontSize: 12,
                              color: AppColors.greyColor,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: AppColors.feadGreyOrgColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF8B5CF6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Enroll Course- ₹ 299',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsTab() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                '4.7',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 16),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    color: index < 4
                        ? const Color(0xFFFFA726)
                        : Colors.grey.shade300,
                    size: 24,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildRatingBar('5 Star', 0.8),
          const SizedBox(height: 8),
          _buildRatingBar('4 Star', 0.9),
          const SizedBox(height: 8),
          _buildRatingBar('3 Star', 0.7),
          const SizedBox(height: 8),
          _buildRatingBar('2 Star', 0.3),
          const SizedBox(height: 8),
          _buildRatingBar('1 Star', 0.2),
        ],
      ),
    );
  }

  Widget _buildRatingBar(String label, double progress) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFA726),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CourseHorizontalCard extends StatelessWidget {
  final String title;
  final int? count;
  final Color color;
  final IconData icon;

  const CourseHorizontalCard({
    super.key,
    required this.title,
    this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 80,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon with circular background
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 18,
            ),
          ),
          const SizedBox(height: 6),
          // Title text
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
