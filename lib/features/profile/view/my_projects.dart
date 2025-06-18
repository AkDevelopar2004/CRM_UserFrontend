import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constant/app_colors.dart';
import '../../../common/constant/app_images.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../bloc/profile_bloc/profile_bloc.dart';
import '../widget/project_card_widget.dart';

class MyProjectsScreen extends StatelessWidget {
  const MyProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            final selectedIndex =
                state is TabChangedState ? state.selectedIndex : 0;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      _buildTab(
                        context: context,
                        index: 0,
                        selectedIndex: selectedIndex,
                        label: 'In Progress (2)',
                        icon: Icons.work_outline,
                      ),
                      const SizedBox(width: 10),
                      _buildTab(
                        context: context,
                        index: 1,
                        selectedIndex: selectedIndex,
                        label: 'All Projects (6)',
                        icon: Icons.folder_outlined,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: selectedIndex == 0
                      ? _buildInProgressProjects()
                      : _buildAllProjects(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTab({
    required BuildContext context,
    required int index,
    required int selectedIndex,
    required String label,
    required IconData icon,
  }) {
    final isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => context.read<ProfileBloc>().add(ChangeTabEvent(index)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primarySkyColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  isSelected ? AppColors.primarySkyColor : Colors.grey.shade300,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color:
                      isSelected ? AppColors.whiteColor : AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
            'https://i.pravatar.cc/40?img=3https://i.pravatar.cc/40?img=4'
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
      ],
    );
  }

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
      ],
    );
  }
}
