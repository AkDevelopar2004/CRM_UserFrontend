import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_side_team_frontend/bloc/course_bloc/quesstion_bloc/question_bloc.dart';

import '../../enviorment_config/app_loader.dart';
import '../../bloc/profile_bloc/profile_bloc.dart';
import '../../bloc/theme_bloc/theme_bloc.dart';

class AppBlocProviders {
  static MultiBlocProvider provide({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
        BlocProvider(
          create: (_) => ThemeBloc()..add(LoadThemeEvent()),
          child: const MyApp(),
        ),
        BlocProvider<ProfileBloc>(create: (_) => ProfileBloc()),
        BlocProvider<QuestionBloc>(create:(_)=>QuestionBloc())
      ],
      child: child,
    );
  }
}
