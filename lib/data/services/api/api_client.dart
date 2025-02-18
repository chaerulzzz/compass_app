import 'dart:convert';
import 'dart:io';

import 'package:compass_app/data/services/api/model/login/login_response.dart';
import 'package:dio/dio.dart';

import '../../../utils/result.dart';
import '../shared_preferences_services.dart';
import 'model/login/login_request.dart';

Future<Dio> initDio(String baseUrl) async {
  Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: Duration(minutes: 1),
    receiveTimeout: Duration(minutes: 1)
  ));

  /// For logging dio response request
  dio.interceptors.add(LogInterceptor(request: true,
      responseBody: true,
      requestBody: true,
      requestHeader: true));

  await SharedPreferencesService().fetchToken().then((result) {
    switch(result) {
      case Ok<String?>():
        if (result.value != null) {
          dio.options.headers["Authorization"] = "Bearer ${result.value}";
        }
      case Error<String?>():
        result.error;
    }
  });

  if (Platform.isAndroid) {
    dio.options.headers["User-Agent"] = '''android''';
  } else if (Platform.isIOS) {
    dio.options.headers["User-Agent"] = '''darwin''';
  }

  return dio;
}

class ApiClient {
  ApiClient({String? host, int? port})
      : _host = host ?? 'localhost',
        _port = port ?? 8080;

  final String _host;
  final int _port;
  Dio? _dio;

  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      _dio ??= await initDio("$_host:$_port");
      final response = await _dio!.post("$_host:$_port/login",
          data: jsonEncode(loginRequest));

      if (response.statusCode == 200) {
        return Result.ok(LoginResponse.fromJson(response.data));
      } else {
        return const Result.error(HttpException("Login error"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}