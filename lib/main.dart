import 'package:flutter/material.dart';
import 'package:user_side_team_frontend/utils/navigation/app_router.dart';
import 'package:url_strategy/url_strategy.dart';
void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'User Side',
        // theme: AppTheme.violetEdgeTheme,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider);
  }
}
