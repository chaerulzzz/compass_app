import 'package:compass_app/utils/result.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const _tokenKey = 'TOKEN';
  final _log = Logger('SharedPreferencesService');

  // Fungsi untuk mendapatkan token yg disimpan di dalam shared preferences
  Future<Result<String?>> fetchToken() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      _log.finer('Got token from shared preferences');
      return Result.ok(sharedPreferences.getString(_tokenKey));
    } on Exception catch (ex) {
      _log.warning('Failed to get token', ex);
      return Result.error(ex);
    }
  }

  // Fungsi untuk menyimpan token ke dalam shared preferences
  Future<Result<void>> saveToken(String? token) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();

      if (token == null) {
        _log.finer('Removed token');
        await sharedPreferences.remove(_tokenKey);
      } else {
        _log.finer('Replaced token');
        await sharedPreferences.setString(_tokenKey, token);
      }

      return const Result.ok(null);
    } on Exception catch (ex) {
      _log.warning('Failed to set token', ex);
      return Result.error(ex);
    }
  }
}
