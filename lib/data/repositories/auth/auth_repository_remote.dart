import 'package:compass_app/data/repositories/auth/auth_repository.dart';
import 'package:compass_app/data/services/api/model/login/login_request.dart';
import 'package:compass_app/data/services/api/model/login/login_response.dart';
import 'package:logging/logging.dart';

import '../../../utils/result.dart';
import '../../services/api/api_client.dart';
import '../../services/shared_preferences_services.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({
    required ApiClient apiClient,
    required SharedPreferencesService sharedPreferencesService
  })
      : _apiClient = apiClient,
        _sharedPrefService = sharedPreferencesService;

  final ApiClient _apiClient;
  final SharedPreferencesService _sharedPrefService;

  bool? _isAuthenticated;
  final _log = Logger('AuthRepositoryRemote');

  /// Fetch token from shared preferences
  Future<void> _fetch() async {
    final result = await _sharedPrefService.fetchToken();
    switch (result) {
      case Ok<String?>():
        _isAuthenticated = result.value != null;
      case Error<String?>():
        _log.severe('Failed to fetch Token from Shared Preferences',
            result.error);
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    if (_isAuthenticated != null) {
      return _isAuthenticated!;
    }

    await _fetch();
    return _isAuthenticated ?? false;
  }

  @override
  Future<Result<void>> login({
    required String email,
    required String password
  }) async {
    try {
      final result = await _apiClient.login(
          LoginRequest(email: email, password: password));

      switch(result) {
        case Ok<LoginResponse>():
          _log.info('User Logged in');
          _isAuthenticated = true;
          return await _sharedPrefService.saveToken(result.value.token);
        case Error<LoginResponse>():
          _log.warning('Error logging in: ${result.error}');
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout() async {
    _log.info('User logged out');
    try {
      final result = await _sharedPrefService.saveToken(null);
      if (result is Error<void>) {
        _log.severe('Failed to clear stored auth token');
      }

      _isAuthenticated = false;
      return result;
    } finally {
      notifyListeners();
    }
  }
}