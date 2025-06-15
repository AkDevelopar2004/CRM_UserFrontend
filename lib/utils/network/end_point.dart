import '../../enviorment_config/envoirment_config.dart';

class EndPoint {
  // static const String baseUrl = 'ssp-dev.simplifysandbox.net';
  static var appBaseUrl =
      EnvironmentConfiguration.baseUrlApi; //'v4-dev.simplifysandbox.net';
  static const String loginUrl = '/auth/v1/api/user/login';
  
}
