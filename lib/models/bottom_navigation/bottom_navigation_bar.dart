import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:user_side_team_frontend/common/constant/app_colors.dart';
import 'package:user_side_team_frontend/common/constant/app_images.dart';
import 'package:user_side_team_frontend/models/case_study/view/case_study_view.dart';
import 'package:user_side_team_frontend/models/course/course_screen.dart';
import 'package:user_side_team_frontend/models/homescreen/view/home_screen.dart';
import 'package:user_side_team_frontend/models/project/view/project_view.dart';

import '../profile/view/account.dart';

class BottomNavigationBarView extends StatefulWidget {
  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _selectedIndex = 2;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static final List<Widget> _widgetOptions = <Widget>[
    //  const Text('Coursess', style: optionStyle),
     const CourseScreen(),
    ProjectView(),
    const HomeScreen(),
    const CaseStudyView(),
    // Text("case study", style: optionStyle),
    // const Text('Profile', style: optionStyle),
    
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
                child: GNav(
                  rippleColor: AppColors.borderColor.withOpacity(0.5),
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: AppColors.whiteColor,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: [
                    GButton(
                      backgroundColor: AppColors.primarySkyColor,
                      icon: Icons.circle,
                      iconColor: Colors.transparent,
                      iconActiveColor: Colors.blue,
                      text: "Courses",
                      textColor: AppColors.whiteColor,
                      leading: SvgPicture.asset(
                        AppIcons.bookIcon,
                        width: 24,
                        height: 24,
                        color: _selectedIndex == 0
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                      ),
                    ),
                    GButton(
                      backgroundColor: AppColors.primarySkyColor,
                      icon: Icons.circle,
                      iconColor: Colors.transparent,
                      iconActiveColor: Colors.blue,
                      text: "Projects",
                      textColor: AppColors.whiteColor,
                      leading: SvgPicture.asset(
                        AppIcons.documenticon,
                        width: 24,
                        height: 24,
                        color: _selectedIndex == 1
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                      ),
                    ),
                    GButton(
                      backgroundColor: AppColors.primarySkyColor,
                      icon: Icons.circle,
                      iconColor: Colors.transparent,
                      iconActiveColor: Colors.blue,
                      text: "Home",
                      textColor: AppColors.whiteColor,
                      leading: SvgPicture.asset(
                        AppIcons.homeIcon,
                        width: 24,
                        height: 24,
                        color: _selectedIndex == 2
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                      ),
                    ),
                    GButton(
                      backgroundColor: AppColors.primarySkyColor,
                      icon: Icons.circle,
                      iconColor: Colors.transparent,
                      iconActiveColor: Colors.blue,
                      text: "Case Study",
                      textColor: AppColors.whiteColor,
                      leading: SvgPicture.asset(
                        AppIcons.receiptSearchIcon,
                        width: 24,
                        height: 24,
                        color: _selectedIndex == 3
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                      ),
                    ),
                    GButton(
                      backgroundColor: AppColors.primarySkyColor,
                      icon: Icons.circle,
                      iconColor: Colors.transparent,
                      iconActiveColor: Colors.blue,
                      text: "Profile",
                      textColor: AppColors.whiteColor,
                      leading: SvgPicture.asset(
                        AppIcons.profileIcon,
                        width: 24,
                        height: 24,
                        color: _selectedIndex == 4
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                      ),
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: _onItemTapped,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
