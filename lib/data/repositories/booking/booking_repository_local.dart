import 'package:compass_app/data/repositories/booking/booking_repository.dart';
import 'package:compass_app/data/services/local/local_data_service.dart';
import 'package:compass_app/domain/models/booking/booking.dart';
import 'package:compass_app/domain/models/booking/booking_summary.dart';
import 'package:compass_app/utils/result.dart';

class BookingRepositoryLocal implements BookingRepository {

  BookingRepositoryLocal({required localDataService})
    : _localDataService = localDataService;

  final _bookings = List<Booking>.empty(growable: true);
  final LocalDataService _localDataService;

  bool _isInitialized = false;
  int _sequentialId = 0;

  @override
  Future<Result<void>> createBooking(Booking booking) async {
    final bookingWithId = booking.copyWith(id: _sequentialId++);
    _bookings.add(bookingWithId);
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> delete(int id) async {
    _bookings.removeWhere((booking) => booking.id == id);
    return const Result.ok(null);
  }

  @override
  Future<Result<Booking>> getBooking(int id) async {
    final booking = _bookings.where((booking) => booking.id == id).firstOrNull;
    if (booking == null) {
      return Result.error(Exception('Booking not found'));
    }

    return Result.ok(booking);
  }

  @override
  Future<Result<List<BookingSummary>>> getBookingList() async {
    if (!_isInitialized) {
      await _createDefaultBooking();
      _isInitialized = true;
    }

    return Result.ok(_createSummaries());
  }

  List<BookingSummary> _createSummaries() {
    return _bookings
        .map((booking) => BookingSummary(
          id: booking.id!,
          name: '${booking.destination.name}, ${booking.destination.continent}',
          startDate: booking.startDate,
          endDate: booking.endDate
    )).toList();
  }

  Future<void> _createDefaultBooking() async {
    if (_bookings.isEmpty) {
      final destination = (await _localDataService.getDestinations()).first;
      final activities = (await _localDataService.getActivities())
          .where((activity) => activity.destinationRef == destination.ref)
          .take(4)
          .toList();

      _bookings.add(Booking(
          id: _sequentialId++,
          startDate: DateTime(2025, 1, 1),
          endDate: DateTime(2025, 2, 1),
          destination: destination,
          activity: activities));
    }
  }

}