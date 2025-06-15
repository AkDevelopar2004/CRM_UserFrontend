import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/features/about_course/view/congrates_screen.dart';
import 'package:user_side_team_frontend/features/about_course/view/question_screen.dart';
import 'package:user_side_team_frontend/features/about_course/view/quiz_screen.dart';
import 'package:user_side_team_frontend/features/auth/view/forgot_password.dart';
import 'package:user_side_team_frontend/features/auth/view/login_screen.dart';
import 'package:user_side_team_frontend/features/auth/view/singup_screen.dart';
import 'package:user_side_team_frontend/features/auth/view/splash_screen.dart';
import 'package:user_side_team_frontend/features/auth/view/verify_otp_screen.dart';
import 'package:user_side_team_frontend/features/bottom_navigation/bottom_navigation_bar.dart';
import 'package:user_side_team_frontend/features/case_study/view/detail_case_study_view.dart';
import 'package:user_side_team_frontend/features/about_course/view/about_course.dart';
import 'package:user_side_team_frontend/features/community_guidelines/view/community_guidelines.dart';
import 'package:user_side_team_frontend/features/homescreen/view/home_screen.dart';
import 'package:user_side_team_frontend/features/notification/notification_detail_screen.dart';
import 'package:user_side_team_frontend/features/notification/notification_view.dart';
import 'package:user_side_team_frontend/features/profile/view/profile_account.dart';
import 'package:user_side_team_frontend/features/profile/view/edit_profile_screen.dart';
import 'package:user_side_team_frontend/features/profile/view/payments_screem.dart';
import 'package:user_side_team_frontend/features/project/view/project_readymade_view.dart';
import 'package:user_side_team_frontend/features/project/view/send_reference_view.dart';
import 'package:user_side_team_frontend/features/support/view/support_view.dart';
import 'package:user_side_team_frontend/utils/navigation/app_routes.dart';

import '../../features/about_course/controller/quiz_controller.dart';
import '../../features/auth/view/change_password_screen.dart';
import '../../features/profile/view/appsettings_view.dart';
import '../../features/profile/view/invoice_view.dart';
import '../../features/profile/view/notificationSettings_view.dart';
import '../../features/profile/profile_controller/profile_controller.dart';
import '../../features/profile/view/invoice_view.dart';
import '../../features/profile/view/my_projects.dart';
import '../../features/profile/view/servicesTaken_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signupScreen,
        builder: (context, state) => const SingupScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPassword(),
      ),
      GoRoute(
        path: AppRoutes.verifyOtp,
        builder: (context, state) => const VerifyOtpScreen(),
      ),
      GoRoute(
        path: AppRoutes.changePassword,
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        builder: (context, state) => BottomNavigationBarView(),
      ),
      GoRoute(
        path: AppRoutes.notification,
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: AppRoutes.detailNotification,
        builder: (context, state) => const DetailNotificationScreen(),
      ),
      GoRoute(
        path: AppRoutes.bottomNavBar,
        builder: (context, state) => BottomNavigationBarView(),
      ),
      GoRoute(
        path: AppRoutes.detailedCaseStudy,
        builder: (context, state) => const DetailCaseStudyView(),
      ),
      GoRoute(
        path: AppRoutes.readymadeProject,
        builder: (context, state) => const ProjectReadymadeView(),
      ),
      GoRoute(
        path: AppRoutes.sendReferenceView,
        builder: (context, state) => const SendReferenceView(),
      ),
      GoRoute(
        path: AppRoutes.profileView,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.aboutCourse,
        builder: (context, state) => const AboutCourse(),
      ),
      GoRoute(
        path: AppRoutes.servicestakenview,
        builder: (context, state) => const ServicesTakenScreen(),
      ),
      GoRoute(
        path: AppRoutes.invoicesview,
        builder: (context, state) => const InvoicesScreen(),
      ),
      GoRoute(
        path: AppRoutes.editProfileScreen,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.communityguideLines,
        builder: (context, state) => const CommunityGuidelines(),
      ),
       GoRoute(
        path: AppRoutes.support,
        builder: (context, state) => const SupportView(),
      ),
      GoRoute(
        path: AppRoutes.myProjectsScreen,
        builder: (context, state) {
          Get.lazyPut<ProjectController>(() => ProjectController());
          return const MyProjectsScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.quizscreen,
        builder: (context, state) => const QuizScreen(),
      ),
      GoRoute(
        path: AppRoutes.questionScreen,
        builder: (context, state) {
          Get.lazyPut<QuestionController>(() => QuestionController());
          return QuestionScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.quizscreen,
        builder: (context, state) => const QuizScreen(),
      ),
      GoRoute(
        path: AppRoutes.questionScreen,
        builder: (context, state) {
          Get.lazyPut<QuestionController>(() => QuestionController());
          return QuestionScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.congratesScreen,
        builder: (context, state) => const CongratesScreen(),
      ),
      GoRoute(
        path: AppRoutes.appsettingview,
        builder: (context, state) => const AppSettingScreen(),
      ),
      GoRoute(
        path: AppRoutes.notificationview,
        builder: (context, state) => const NotificationsScreen(),
      ),
      //  GoRoute(
      //   path: AppRoutes.privacyview,
      //   builder: (context, state) =>  PrivacyScreen(),
      // ),
    ],
  );
}
