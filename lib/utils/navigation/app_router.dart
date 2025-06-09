import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/models/auth/view/forgot_password.dart';
import 'package:user_side_team_frontend/models/auth/view/login_screen.dart';
import 'package:user_side_team_frontend/models/auth/view/singup_screen.dart';
import 'package:user_side_team_frontend/models/auth/view/splash_screen.dart';
import 'package:user_side_team_frontend/models/auth/view/verify_otp_screen.dart';
import 'package:user_side_team_frontend/models/bottom_navigation/bottom_navigation_bar.dart';
import 'package:user_side_team_frontend/models/case_study/view/detail_case_study_view.dart';
import 'package:user_side_team_frontend/models/homescreen/view/home_screen.dart';
import 'package:user_side_team_frontend/models/notification/notification_detail_screen.dart';
import 'package:user_side_team_frontend/models/notification/notification_view.dart';
import 'package:user_side_team_frontend/models/profile/view/account.dart';
import 'package:user_side_team_frontend/models/profile/view/edit_profile_screen.dart';
import 'package:user_side_team_frontend/models/project/view/project_readymade_view.dart';
import 'package:user_side_team_frontend/models/project/view/send_reference_view.dart';
import 'package:user_side_team_frontend/utils/navigation/app_routes.dart';

import '../../models/auth/view/change_password_screen.dart';

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
      GoRoute(path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPassword(), 
      ),
      GoRoute(path:  AppRoutes.verifyOtp,
        builder: (context, state) => const VerifyOtpScreen(),
      ),
      GoRoute(path: AppRoutes.changePassword,
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
        builder: (context, state) => DetailCaseStudyView(),
      ),
      GoRoute(
        path: AppRoutes.readymadeProject,
        builder: (context, state) => ProjectReadymadeView(),
      ),
      GoRoute(
        path: AppRoutes.sendReferenceView,
        builder: (context, state) => SendReferenceView(),
      ),
       GoRoute(
        path: AppRoutes.profileView,
        builder: (context, state) => ProfileScreen(),
      ),
       GoRoute(
        path: AppRoutes.editProfileScreen,
        builder: (context, state) => EditProfileScreen(),
      ),
    ],
  );
}
