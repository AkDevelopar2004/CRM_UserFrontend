

import 'enviorment_config/app_loader.dart';
import 'enviorment_config/env_paths.dart';

void main() async {
  AppLoader appLoader = AppLoader();
  appLoader.loadApp(EnvPaths.pathDemo);
}