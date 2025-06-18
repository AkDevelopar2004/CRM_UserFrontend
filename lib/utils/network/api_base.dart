import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';


typedef ApiResponseSuccess = Function(dynamic data);
typedef ApiResponseFailure = Function(String error);

const String jsonContentType = 'application/json';

class ApiBase {
  final Map<String, String> _headers;
  String? token = '';

  ApiBase({Map<String, String>? headers})
      : _headers = headers ?? {'Content-Type': jsonContentType};

  Future<dynamic> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return json; // ✅ Return data
      } else {
        throw Exception(json['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // This returns the response body directly (for BLoC use)
  Future<Map<String, dynamic>> postWithResponse(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      _headers['Authorization'] = token ?? '';
      _headers.remove('content-length');

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: _headers,
      );

      log("\x1B[34mPOST $url => ${response.body}\x1B[0m");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body);
      } else {
        final error = jsonDecode(response.body);
        throw Exception(
            error['message'] ?? 'Failed with ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("POST failed: $e");
    }
  }

  Future<Map<String, dynamic>> multipartPostWithResponse({
    required String url,
    required Map<String, String> fields,
    required File imageFile,
    String fileFieldKey = 'img',
  }) async {
    try {
      final uri = Uri.parse(url);
      final request = http.MultipartRequest('POST', uri)
        ..fields.addAll(fields)
        ..headers.addAll({
          'Accept': '*/*',
          'Authorization': token ?? '',
        });

      final mimeType = lookupMimeType(imageFile.path);
      final multipartFile = await http.MultipartFile.fromPath(
        fileFieldKey,
        imageFile.path,
        contentType: MediaType.parse(mimeType ?? 'image/jpeg'),
      );
      request.files.add(multipartFile);

      final response = await request.send();
      final resBody = await response.stream.bytesToString();

      log("\x1B[36mMULTIPART $url => $resBody\x1B[0m");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(resBody);
      } else {
        final error = jsonDecode(resBody);
        throw Exception(
            error['message'] ?? 'Failed with ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Multipart POST failed: $e");
    }
  }

  Future<Map<String, dynamic>> putWithResponse(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      _headers['Authorization'] = token ?? '';
      _headers.remove('content-length');

      final response = await http.put(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: _headers,
      );

      log("\x1B[34mPOST $url => ${response.body}\x1B[0m");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body);
      } else {
        final error = jsonDecode(response.body);
        throw Exception(
            error['message'] ?? 'Failed with ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("put failed: $e");
    }
  }

  Future<Map<String, dynamic>> multipartPutWithResponse({
    required String url,
    required Map<String, String> fields,
    required File imageFile,
    String fileFieldKey = 'img',
  }) async {
    try {
      final uri = Uri.parse(url);
      final request = http.MultipartRequest('PUT', uri)
        ..fields.addAll(fields)
        ..headers.addAll({
          'Accept': '*/*',
          'Authorization': token ?? '',
        });

      final mimeType = lookupMimeType(imageFile.path);
      final multipartFile = await http.MultipartFile.fromPath(
        fileFieldKey,
        imageFile.path,
        contentType: MediaType.parse(mimeType ?? 'image/jpeg'),
      );
      request.files.add(multipartFile);

      final response = await request.send();
      final resBody = await response.stream.bytesToString();

      log("\x1B[36mMULTIPART $url => $resBody\x1B[0m");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(resBody);
      } else {
        final error = jsonDecode(resBody);
        throw Exception(
            error['message'] ?? 'Failed with ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Multipart POST failed: $e");
    }
  }

  Future<void> post(
    String url,
    Map<String, dynamic> body,
    ApiResponseSuccess onSuccess,
    ApiResponseFailure onFailure, {
    bool? isTokenMandatory = false,
  }) async {
    // await getGroupId();

    if (isTokenMandatory == false) {
      _headers['Authorization'] = token ?? '';
    }
    // ✅ Explicitly remove 'content-length' if it exists
    if (_headers.containsKey('content-length')) {
      _headers.remove('content-length');
    }

    log("\x1B[35m${"Payload -> $body"}\x1B[0m");
    _request(
      (uri) => http.post(uri, body: jsonEncode(body), headers: _headers),
      url,
      onSuccess,
      onFailure,
    );
  }

  Future<dynamic> postReturningJson({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await http.post(Uri.parse(url), body: body);
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data['message'] ?? "Something went wrong");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // post multipart for form data
  Future<void> multipartPost(
      String url,
      Map<String, String> fields,
      File? imageFile,
      ApiResponseSuccess onSuccess,
      ApiResponseFailure onFailure,
      {String? fileFieldKey}) async {
    try {
      final uri = Uri.parse(url);
      final request = http.MultipartRequest('POST', uri)
        ..fields.addAll(fields)
        ..headers.addAll({
          'Accept': '*/*',
          'Authorization': token ?? '',
        });

      // Add image if present
      if (imageFile != null) {
        final mimeType =
            lookupMimeType(imageFile.path); // requires `mime` package
        final multipartFile = await http.MultipartFile.fromPath(
          fileFieldKey ?? 'profileImg', // 🔁 must match your backend field name
          imageFile.path,
          contentType: MediaType.parse(mimeType ?? 'image/jpeg'),
        );
        request.files.add(multipartFile);
      }

      final response = await request.send();
      final resBody = await response.stream.bytesToString();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(jsonDecode(resBody));
      } else {
        final errorResponse = jsonDecode(resBody);
        onFailure(errorResponse['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      onFailure('Exception: ${e.toString()}');
    }
  }

  // put api for form data

  Future<void> multipartPut(
      String url,
      Map<String, String> fields,
      File? imageFile,
      ApiResponseSuccess onSuccess,
      ApiResponseFailure onFailure,
      {String? fileFieldKey}) async {
    try {
      final uri = Uri.parse(url);
      final request = http.MultipartRequest('PUT', uri)
        ..fields.addAll(fields)
        ..headers.addAll({
          'Accept': '*/*',
          'Authorization': token ?? '',
        });

      // Add image if present
      if (imageFile != null) {
        final mimeType =
            lookupMimeType(imageFile.path); // requires `mime` package
        final multipartFile = await http.MultipartFile.fromPath(
          fileFieldKey ??
              'profile_img', // 🔁 must match your backend field name
          imageFile.path,
          contentType: MediaType.parse(mimeType ?? 'image/jpeg'),
        );
        request.files.add(multipartFile);
      }

      final response = await request.send();
      final resBody = await response.stream.bytesToString();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(jsonDecode(resBody));
      } else {
        final errorResponse = jsonDecode(resBody);
        onFailure(errorResponse['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      onFailure('Exception: ${e.toString()}');
    }
  }

  Future<void> put(
    String url,
    Map<String, dynamic> body,
    ApiResponseSuccess onSuccess,
    ApiResponseFailure onFailure, {
    bool? isTokenMandatory = false,
  }) async {
    // await getGroupId();

    if (isTokenMandatory == false) {
      _headers['Authorization'] = token ?? '';
    }
    log("\x1B[35m${"Payload -> $body"}\x1B[0m");
    _request(
      (uri) => http.put(uri, body: jsonEncode(body), headers: _headers),
      url,
      onSuccess,
      onFailure,
    );
  }

  Future<void> delete(
    String url,
    ApiResponseSuccess onSuccess,
    ApiResponseFailure onFailure, {
    bool? isTokenMandatory = false,
  }) async {
    // await getGroupId();

    if (isTokenMandatory == false) {
      _headers['Authorization'] = token ?? '';
    }
    _request(
      (uri) => http.delete(uri, headers: _headers),
      url,
      onSuccess,
      onFailure,
    );
  }

  Future<void> _request(
    Function requestMethod,
    String url,
    ApiResponseSuccess onSuccess,
    ApiResponseFailure onFailure,
  ) async {
    try {
      log("\x1B[37m${"URL -> $url"}\x1B[0m");
      final response = await requestMethod(Uri.parse(url));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        log("\x1B[32m${"Response Body -> ${response.body}"}\x1B[0m");
        onSuccess(jsonDecode(response.body));
      } else {
        final errorResponse = jsonDecode(response.body);
        final errorMessage = errorResponse['message'] ?? 'Failed to load data.';
        log("\x1B[31m${"Response Body -> $errorMessage"}\x1B[0m");

        switch (response.statusCode) {
          case 400:
            onFailure('Bad request: $errorMessage');
            break;
          case 401:
            onFailure('Unauthorized: $errorMessage');
            break;
          case 403:
            onFailure('Forbidden: $errorMessage');
            break;
          case 404:
            onFailure('Not found: $errorMessage');
            break;
          case 500:
            onFailure('Internal server error: $errorMessage');
            break;
          default:
            onFailure(
              'Failed to load data. Status code: ${response.statusCode}',
            );
            break;
        }
      }
    } catch (e) {
      onFailure('An error occurred: $e');
    }
  }

  void addHeader(String key, String value) {
    _headers[key] = value;
  }

  String getHeader(String key) {
    return _headers[key] ?? "";
  }
}
