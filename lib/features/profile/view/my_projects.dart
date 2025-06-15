import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';

import '../../../common/constant/app_images.dart';
import '../../../common/widgets/text_widget.dart';
import '../profile_controller/profile_controller.dart';
import '../widget/project_card_widget.dart';

class MyProjectsScreen extends StatelessWidget {
  const MyProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProjectController controller = Get.find<ProjectController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                  text: "My Projects",
                  color: AppColors.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz, color: AppColors.blackColor),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GetBuilder<ProjectController>(
                builder: (controller) {
                  return Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.changeTab(0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: controller.selectedTab == 0
                                  ? AppColors.primarySkyColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: controller.selectedTab == 0
                                    ? AppColors.primarySkyColor
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.work_outline,
                                  color: controller.selectedTab == 0
                                      ? AppColors.whiteColor
                                      : AppColors.greyColor,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'In Progress (3)',
                                  style: TextStyle(
                                    color: controller.selectedTab == 0
                                        ? AppColors.whiteColor
                                        : AppColors.greyColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.changeTab(1),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: controller.selectedTab == 1
                                  ? AppColors.primarySkyColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: controller.selectedTab == 1
                                    ? AppColors.primarySkyColor
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_outlined,
                                  color: controller.selectedTab == 1
                                      ? Colors.white
                                      : Colors.grey,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'All Projects (6)',
                                  style: TextStyle(
                                    color: controller.selectedTab == 1
                                        ? Colors.white
                                        : Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            //  selected tab
            Expanded(
              child: GetBuilder<ProjectController>(
                builder: (_) {
                  return controller.selectedTab == 0
                      ? _buildInProgressProjects()
                      : _buildAllProjects();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // In Progress
  Widget _buildInProgressProjects() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: const [
        ProjectCardWidget(
          title: 'Project Name',
          subtitle: 'E-commerce',
          progress: 0.7,
          progressText: '70%',
          status: 'In Progress',
          statusColor: Colors.blue,
          avatars: [
            'https://i.pravatar.cc/40?img=1',
            'https://i.pravatar.cc/40?img=2',
            'https://i.pravatar.cc/40?img=3'
                'https://i.pravatar.cc/40?img=4'
          ],
          moreCount: '2+',
        ),
        SizedBox(height: 16),
        ProjectCardWidget(
          title: 'Project Name',
          subtitle: 'E-commerce',
          progress: 0.4,
          progressText: '40%',
          status: 'Review',
          statusColor: Colors.orange,
          avatars: [
            'https://i.pravatar.cc/40?img=5',
            'https://i.pravatar.cc/40?img=6',
            'https://i.pravatar.cc/40?img=7',
          ],
          moreCount: '1+',
        ),
        SizedBox(height: 16),
        ProjectCardWidget(
          title: 'Project Name',
          subtitle: 'E-commerce',
          progress: 0.4,
          progressText: '40%',
          status: 'In Progress',
          statusColor: Colors.blue,
          avatars: [
            'https://i.pravatar.cc/40?img=8',
            'https://i.pravatar.cc/40?img=9',
          ],
          moreCount: '3+',
        ),
      ],
    );
  }

  // All Projects
  Widget _buildAllProjects() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: const [
        ProjectCardWidget(
          title: 'Completed Project 1',
          subtitle: 'Mobile App',
          progress: 1.0,
          progressText: '100%',
          status: 'Completed',
          statusColor: Colors.green,
          avatars: [
            'https://i.pravatar.cc/40?img=10',
            'https://i.pravatar.cc/40?img=11',
          ],
          moreCount: '1+',
        ),
        SizedBox(height: 16),
        ProjectCardWidget(
          title: 'Project Name',
          subtitle: 'E-commerce',
          progress: 0.7,
          progressText: '70%',
          status: 'In Progress',
          statusColor: Colors.blue,
          avatars: [
            'https://i.pravatar.cc/40?img=1',
            'https://i.pravatar.cc/40?img=2',
          ],
          moreCount: '2+',
        ),
        SizedBox(height: 16),
        ProjectCardWidget(
          title: 'Website Redesign',
          subtitle: 'Web Development',
          progress: 0.9,
          progressText: '90%',
          status: 'Review',
          statusColor: Colors.orange,
          avatars: [
            'https://i.pravatar.cc/40?img=12',
            'https://i.pravatar.cc/40?img=13',
            'https://i.pravatar.cc/40?img=14',
          ],
          moreCount: '',
        ),
        SizedBox(height: 16),
        ProjectCardWidget(
          title: 'Dashboard Project',
          subtitle: 'Analytics',
          progress: 0.3,
          progressText: '30%',
          status: 'In Progress',
          statusColor: Colors.blue,
          avatars: [
            'https://i.pravatar.cc/40?img=15',
            'https://i.pravatar.cc/40?img=16',
          ],
          moreCount: '4+',
        ),
        SizedBox(height: 16),
        ProjectCardWidget(
          title: 'Marketing Campaign',
          subtitle: 'Digital Marketing',
          progress: 0.6,
          progressText: '60%',
          status: 'In Progress',
          statusColor: Colors.blue,
          avatars: [
            'https://i.pravatar.cc/40?img=17',
            'https://i.pravatar.cc/40?img=18',
          ],
          moreCount: '1+',
        ),
        SizedBox(height: 16),
        ProjectCardWidget(
          title: 'Brand Identity',
          subtitle: 'Design',
          progress: 1.0,
          progressText: '100%',
          status: 'Completed',
          statusColor: Colors.green,
          avatars: [
            'https://i.pravatar.cc/40?img=19',
            'https://i.pravatar.cc/40?img=20',
          ],
          moreCount: '',
        ),
      ],
    );
  }
}
