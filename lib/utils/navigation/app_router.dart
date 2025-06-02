import 'package:go_router/go_router.dart';
import 'package:user_side_team_frontend/models/auth/view/splash_screen.dart';
import 'package:user_side_team_frontend/models/bottom_navigation/bottom_navigation_bar.dart';
import 'package:user_side_team_frontend/models/case_study/view/detail_case_study_view.dart';
import 'package:user_side_team_frontend/models/notification/notification_detail_screen.dart';
import 'package:user_side_team_frontend/models/notification/notification_view.dart';
import 'package:user_side_team_frontend/models/project/view/project_readymade_view.dart';
import 'package:user_side_team_frontend/models/project/view/send_reference_view.dart';
import 'package:user_side_team_frontend/utils/navigation/app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/nav-bar',
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
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

    ],
  );
}
