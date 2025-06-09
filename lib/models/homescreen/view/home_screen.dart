import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/utils/navigation/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          controller: ScrollController(),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerWidget(context),
              const SizedBox(height: 20),
              _searchWidget(),
              const SizedBox(height: 20),
              _categoryChips(),
              const SizedBox(height: 25),
              _recommendedSection(),
              const SizedBox(height: 15),
              _topCoursesSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWidget(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100&h=100&fit=crop&crop=face',
          ),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Nitish Tao',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(119, 92, 255, 1),
                fontWeight: FontWeight.w500,
              ),
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

  Widget _searchWidget() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Topic, tag or Tech',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

Widget _categoryChips() {
  final categories = [
    {
      
      'icon': Image.asset(
        AppImages.flutterImage,
        height: 30,
        width: 85,
      ),
      'color': Colors.blue,
    },
    {
      
      'icon': Image.asset(
        AppImages.nodeImg,
        height: 30,
        width: 85,
      ),
      'color': Colors.blue,
    },
    {
      
      'icon': Image.asset(
        AppImages.androidImg,
        height: 30,
        width: 85,
      ),
      'color': Colors.blue,
    },
    {
      
      'icon': Image.asset(
        AppImages.playstoreImg,
        height: 30,
        width: 85,
      ),
      'color': Colors.blue,
    },{
      
      'icon': Image.asset(
        AppImages.ecommerssImg,
        height: 30,
        width: 85,
      ),
      'color': Colors.blue,
    },{
      
      'icon': Image.asset(
        AppImages.travelImg,
        height: 30,
        width: 85,
      ),
      'color': Colors.blue,
    },
    // पुढे इतर categories uncomment करून वापरू शकता
  ];

  return Wrap(
    spacing: 10,
    runSpacing: 10,
    children: categories.map((category) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            category['icon'] as Widget,
            
           
          ],
        ),
      );
    }).toList(),
  );
}

  Widget _recommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recommended',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See All >',
                style: TextStyle(
                  color: Color.fromRGBO(119, 92, 255, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        // const SizedBox(height: 15),
        SizedBox(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _courseCard(
                title: 'Apka Paisa Waste ho jayega...',
                price: '₹ 299',
                duration: '34 mins',
                thumbnailUrl: 'https://i.imgur.com/7YTMFQp.png',
              ),
              _courseCard(
                title: 'App Development Cost Guide',
                price: '₹ 499',
                duration: '45 mins',
                thumbnailUrl: 'https://i.imgur.com/8xQJ2mR.png',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _topCoursesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Top Courses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See All >',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _topCourseCard(
                title: 'WEB DEVELOPMENT',
                icons: [
                  Icons.html,
                  Icons.css,
                  Icons.javascript,
                ],
                bgColor: const Color(0xFF1E3A8A),
              ),
              const SizedBox(width: 15),
              _topCourseCard(
                title: 'MOBILE APP',
                icons: [
                  Icons.android,
                  Icons.apple,
                  Icons.flutter_dash,
                ],
                bgColor: const Color(0xFF059669),
              ),
            ],
          ),
        ),
      ],
    );
  }

Widget _courseCard({
  required String title,
  required String price,
  required String duration,
  required String thumbnailUrl,
}) {
  return Container(
    width: 250,
    margin: const EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Image.network(
            thumbnailUrl,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 100,
              color: Colors.grey.shade200,
              child: const Center(child: Icon(Icons.image_outlined, size: 40, color: Colors.grey)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                duration,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6A5AE0), // same purple as your screenshot
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget _topCourseCard({
    required String title,
    required List<IconData> icons,
    required Color bgColor,
  }) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Row(
              children: icons.map((icon) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 16,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
