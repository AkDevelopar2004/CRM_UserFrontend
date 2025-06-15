import 'package:flutter/material.dart';

/// Utility class that holds static constant keys used for local storage.
/// We are using get_storage: package to store required data locally
class LocalStorageKeyStrings {
  /// Key used to store and retrieve the user's login status in local storage.
  static const isLogin = 'isLogin';
  static const authToken = 'authToken';
  static const loggedInUserId = 'loggedInUserId';
  static const refreshToken = 'refreshToken';
  static const loginResp = 'loginResp';
  static const clientId = 'clientId';
  static const clientName = 'clientName';
  static const userName = 'userName';
  static const accessToken = 'accessToken';

  static GlobalKey<NavigatorState> appNavKey = GlobalKey<NavigatorState>();
}
