import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_summary.freezed.dart';
part 'booking_summary.g.dart';

/// Booking summary digunakan untuk menampilkan data booking di user home screen.
@freezed
class BookingSummary with _$BookingSummary {
  const factory BookingSummary({
    /// Booking Id
    required int id,

    /// Nama yg akan ditampilkan
    required String name,

    /// Tanggal mulai booking
    required DateTime startDate,

    /// Tanggal selesai Booking
    required DateTime endDate
  }) = _BookingSummary;

  factory BookingSummary.fromJson(Map<String, Object?> json) =>
      _$BookingSummaryFromJson(json);
}