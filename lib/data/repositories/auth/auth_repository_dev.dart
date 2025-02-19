import 'package:compass_app/data/repositories/auth/auth_repository.dart';

import '../../../utils/result.dart';

class AuthRepositoryDev extends AuthRepository {

  /// User selalu terautentikasi di skenario dev
  @override
  Future<bool> get isAuthenticated => Future.value(true);

  /// Login selalu sukses di skenario dev
  @override
  Future<Result<void>> login({required String email, required String password}) async {
    return const Result.ok(null);
  }

  /// Logout selalu sukses di skenario dev
  @override
  Future<Result<void>> logout() async {
    return const Result.ok(null);
  }
}