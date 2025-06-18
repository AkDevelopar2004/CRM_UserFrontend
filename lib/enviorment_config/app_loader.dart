import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_side_team_frontend/bloc/theme_bloc/theme_bloc.dart';
import '../common/constant/app_colors.dart';
import '../utils/navigation/app_router.dart';
import '../utils/provider/app_bloc_provider.dart';
import 'envoirment_config.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

class AppLoader {
  void loadApp(String path) async {
    await dotEnv.load(fileName: path);
    await GetStorage.init();
    WidgetsFlutterBinding.ensureInitialized();
    await _preInit();
    // Initialize Firebase
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // Initialize Local Notification Service

    // await LocalNotificationService.instance.initialize();

    ///Firebase Setup Above
    // Set the background message handler for FCM
    // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    ///Flutter local notification
    // Get.put(NotificationController());

    // _initializeMapMyIndia();
    runApp(AppBlocProviders.provide(child: const MyApp()));
  }
}

// Future<void> _initializeMapMyIndia() async {
//   try {
//     // Replace these with your actual MapMyIndia API keys
//     MapplsAccountManager.setMapSDKKey("f501997f51435d54eb7fd5de7c7d5151");
//     MapplsAccountManager.setRestAPIKey("f501997f51435d54eb7fd5de7c7d5151");
//     MapplsAccountManager.setAtlasClientId(
//         "96dHZVzsAutB1LdHmgCNkicREt60N4LRCYFL0zsHZuem0qFteYzPW_AM6Kzvtwe_Qh8Ao9LI9eJyZOklj4s_sA-sh1ryBV-Z");
//     MapplsAccountManager.setAtlasClientSecret(
//         "lrFxI-iSEg-_uaaZjbs4yJeeZi7-YUeMRbPKK5QXZ0nrfYE4LeooQQ_nbnMKGCg977F2z5a9n2_Z-VPUsW7sbOrribdGh8f4MWgVgduqpk8=");

//     // Optional: Set additional configuration

//     print('MapMyIndia SDK initialized successfully');
//   } catch (e) {
//     print('Error initializing MapMyIndia SDK: $e');
//   }
// }

Future<void> _preInit() async {
  // initDependencyLocator();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.faintSkyColor,
  ));
  // await getIt.allReady();
  // await PhoneService.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeController themeController = Get.put(ThemeController());

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        // Color primaryColor = Colors.blue;
        // if (state is ThemeLoaded) {
        //   primaryColor = state.selectedColor;
        // }
        return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
              useMaterial3: true,
              splashColor: AppColors.transparent, // Removes splash effect
              highlightColor: AppColors.transparent, // Removes highlight effect
              bottomNavigationBarTheme:
                  const BottomNavigationBarThemeData(elevation: 8.0),
              bottomSheetTheme: const BottomSheetThemeData(
                surfaceTintColor: AppColors.whiteColor,
                backgroundColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(26.0),
                  ),
                ),
              ),
            ),
            routerDelegate: AppRouter.router.routerDelegate,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routeInformationProvider:
                AppRouter.router.routeInformationProvider);
      },
    );
  }
}
