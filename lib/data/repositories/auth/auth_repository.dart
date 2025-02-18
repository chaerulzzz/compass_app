import 'package:flutter/cupertino.dart';

import '../../../utils/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  /// Hasilnya true jika user telah login
  Future<bool> get isAuthenticated;

  /// Proses login
  Future<Result<void>> login({required String email, required String password});

  /// Proses logout
  Future<Result<void>> logout();
}