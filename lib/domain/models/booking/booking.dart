import 'package:compass_app/domain/models/activity/activity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../destination/destination.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    /// Booking id bersifat opsional
    int? id,

    /// Tanggal mulai booking
    required DateTime startDate,

    /// Tanggal berakhirnya booking
    required DateTime endDate,

    /// Destinasi booking
    required Destination destination,

    /// Daftar aktivitas yg akan dilakukan
    required List<Activity> activity
  }) = _Booking;

  factory Booking.fromJson(Map<String, Object?> json) =>
      _$BookingFromJson(json);
}