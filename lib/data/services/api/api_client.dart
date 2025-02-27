import 'dart:convert';
import 'dart:io';

import 'package:compass_app/data/services/api/api_config.dart';
import 'package:compass_app/data/services/api/model/login/login_response.dart';
import 'package:compass_app/data/services/api/model/user/user_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/models/activity/activity.dart';
import '../../../domain/models/destination/destination.dart';
import '../../../utils/result.dart';
import '../shared_preferences_services.dart';
import 'model/booking/booking_api_model.dart';
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
  ApiClient({String? host})
      : _host = host ?? ApiConfig.baseUrlDev;

  final String _host;
  Dio? _dio;

  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      _dio ??= await initDio(_host);
      final response = await _dio!.post(ApiConfig.login,
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

  Future<Result<UserModel>> getUser() async {
    try {
      _dio ??= await initDio(_host);
      final response = await _dio!.get(ApiConfig.getUser);
      if (response.statusCode == 200) {
        return Result.ok(UserModel.fromJson(response.data));
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<List<BookingApiModel>>> getBookings() async {
    try {
      _dio ??= await initDio(_host);
      final response = await _dio!.get(ApiConfig.getBooking);
      if (response.statusCode == 200) {
        final data = response.data.map((e) => BookingApiModel.fromJson(e)).toList();
        return Result.ok(data);
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<BookingApiModel>> getBooking(int id) async {
    try {
      _dio ??= await initDio(_host);
      final response = await _dio!.get('${ApiConfig.getBooking}/$id');
      if (response.statusCode == 200) {
        return Result.ok(BookingApiModel.fromJson(response.data));
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<BookingApiModel>> postBooking(BookingApiModel booking) async {
    try {
      final response = await _dio!.post(ApiConfig.getBooking,
          data: jsonEncode(booking));
      if (response.statusCode == 201) {
        return Result.ok(BookingApiModel.fromJson(jsonDecode(response.data)));
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<void>> deleteBooking(int id) async {
    try {
      final response = await _dio!.delete('${ApiConfig.getBooking}/$id');
      if (response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<List<Destination>>> getDestinations() async {
    try {
      _dio ??= await initDio(_host);
      final response = await _dio!.get(ApiConfig.getDestination);
      if (response.statusCode == 200) {
        final data = response.data.map((e) => Destination.fromJson(e)).toList();
        return Result.ok(data);
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<List<Activity>>> getActivityByDestination(String ref) async {
    try {
      _dio ??= await initDio(_host);
      final response = await _dio!.get('${ApiConfig.getDestination}/$ref/activity');
      if (response.statusCode == 200) {
        final data = response.data.map((e) => Activity.fromJson(e)).toList();
        return Result.ok(data);
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}