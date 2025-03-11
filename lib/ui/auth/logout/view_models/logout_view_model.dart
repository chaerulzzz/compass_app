import 'package:compass_app/domain/models/itinerary_config/itinerary_config.dart';
import 'package:compass_app/utils/command.dart';

import '../../../../data/repositories/auth/auth_repository.dart';
import '../../../../data/repositories/itinerary_config/itinerary_config_repository.dart';
import '../../../../utils/result.dart';

class LogoutViewModel {
  LogoutViewModel({
    required AuthRepository authRepository,
    required ItineraryConfigRepository itineraryConfigRepository
  }) : _authLogoutRepository = authRepository,
        _itineraryConfigRepository = itineraryConfigRepository {
    logout = CommandNonArgument(_logout);
  }

  final AuthRepository _authLogoutRepository;
  final ItineraryConfigRepository _itineraryConfigRepository;

  late CommandNonArgument logout;

  Future<Result> _logout() async {
    final result = await _authLogoutRepository.logout();
    switch (result) {
      case Ok<void>():
        return _itineraryConfigRepository.setItineraryConfig(
            const ItineraryConfig()
        );
      case Error<void>():
        return result;
    }
  }
}