import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/constant/local_storageKey.dart';
import 'api_logger.dart';

enum RefreshTokenStatus { active, expired, fail, pending }

enum ErrorCheckResults { end, retry, next, renewSession }

class AppInterceptor extends Interceptor {
  AppInterceptor(
    this._baseUrl,
  );

  final String _baseUrl;

  /*final Dio _retryDio = Dio();
  Dio? _dioWithCookies;
  bool _isRefreshAccessTokenPending = false; */

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? authorization =
        GetStorage().read(LocalStorageKeyStrings.accessToken);
    if (authorization != null && authorization.isNotEmpty) {
      options.headers[HttpHeaders.authorizationHeader] =
          'Bearer $authorization';
    }

    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    Response? response = err.response;
    if (err.response?.statusCode == 401) {
      String? newAccessToken;
      Map<String, dynamic> loginResp =
          GetStorage().read(LocalStorageKeyStrings.loginResp) ?? {};
      if (loginResp.isEmpty) {
        return;
      }
      try {
        final requestOptions = err.response!.requestOptions;
        requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

        final dioRefresh = Dio(
          BaseOptions(
            baseUrl: requestOptions.baseUrl,
            headers: <String, String>{'accept': 'application/json'},
          ),
        );

        final response = await dioRefresh.request<dynamic>(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
          ),
        );

        return handler.resolve(response);
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          // logout();
        }
      }
    }

    // if(err.type)
    handler.next(err);
  }
}

class Logging extends Interceptor {
  final Dio dio;

  Logging(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ApiLogger.logDioRequest(options);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ApiLogger.logDioResponse(response);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ApiLogger.logDioError(err);
    return super.onError(err, handler);
  }
}
