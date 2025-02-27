import 'package:compass_app/domain/models/booking/booking.dart';
import 'package:compass_app/domain/models/booking/booking_summary.dart';
import 'package:compass_app/utils/result.dart';

abstract class BookingRepository {

  ///List booking summary untuk user yg sedang login
  Future<Result<List<BookingSummary>>> getBookingList();

  ///Data booking lengkap berdasarkan Id booking
  Future<Result<Booking>> getBooking(int id);

  ///Membuat data booking baru
  Future<Result<void>> createBooking(Booking booking);

  ///Menghapus data booking
  Future<Result<void>> delete(int id);
}