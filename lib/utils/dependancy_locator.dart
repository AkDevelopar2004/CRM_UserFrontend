

import 'network/app_interceptor.dart';
import 'network/end_point.dart';
import 'network/network_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void initDependencyLocator() {
  getIt
    ..registerLazySingleton<AppInterceptor>(
        () => AppInterceptor(EndPoint.appBaseUrl!))
    ..registerLazySingleton<NetworkService>(() => NetworkService());
}
