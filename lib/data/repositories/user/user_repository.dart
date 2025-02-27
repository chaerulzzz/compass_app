import 'package:compass_app/domain/models/user/user.dart';

import '../../../utils/result.dart';

abstract class UserRepository {
  Future<Result<User>> getUser();
}