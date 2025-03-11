import 'package:compass_app/domain/models/booking/booking_summary.dart';
import 'package:compass_app/domain/models/user/user.dart';
import 'package:compass_app/utils/command.dart';
import 'package:compass_app/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/booking/booking_repository.dart';
import '../../../data/repositories/user/user_repository.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel({
    required BookingRepository bookingRepository,
    required UserRepository userRepository
  }) : _bookingRepository = bookingRepository,
       _userRepository = userRepository {
    load = CommandNonArgument(_load)..execute();
    deleteBooking = CommandWithArgument(_deleteBooking);
  }

  final BookingRepository _bookingRepository;
  final UserRepository _userRepository;
  final _log = Logger('HomeViewModel');
  
  late CommandNonArgument load;
  late CommandWithArgument<void, int> deleteBooking;

  List<BookingSummary> _bookings = [];
  User? _user;

  List<BookingSummary> get bookings => _bookings;
  User? get user => _user;

  Future<Result> _load() async {
    try {
      final result = await _bookingRepository.getBookingList();
      switch (result) {
        case Ok<List<BookingSummary>>():
          _bookings = result.value;
          _log.fine('Loading bookings');
        case Error<List<BookingSummary>>():
          _log.warning('Failed to load bookings', result.error);
          return result;
      }

      final userResult = await _userRepository.getUser();
      switch (userResult) {
        case Ok<User>():
          _user = userResult.value;
          _log.fine('Loaded user');
        case Error<User>():
          _log.warning('Failed to load user', userResult.error);
      }

      return userResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _deleteBooking(int id) async {
    try {
      final resultDelete = await _bookingRepository.delete(id);
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted booking $id');
        case Error<void>():
          _log.warning('Failed to delete booking $id', resultDelete.error);
          return resultDelete;
      }

      final resultLoadBookings = await _bookingRepository.getBookingList();
      switch (resultLoadBookings) {
        case Ok<List<BookingSummary>>():
          _bookings = resultLoadBookings.value;
          _log.fine('Loaded bookings');
        case Error<List<BookingSummary>>():
          _log.warning('Failed to load bookings', resultLoadBookings.error);
          return resultLoadBookings;
      }

      return resultLoadBookings;
    } finally {
      notifyListeners();
    }
  }
}
