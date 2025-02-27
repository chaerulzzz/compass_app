import 'package:compass_app/data/repositories/user/user_repository.dart';

import '../../../domain/models/user/user.dart';
import '../../../utils/result.dart';
import '../../services/local/local_data_service.dart';

class UserRepositoryLocal implements UserRepository {
  UserRepositoryLocal({required LocalDataService localDataService})
    : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<User>> getUser() async {
    return Result.ok(_localDataService.getUser());
  }
}