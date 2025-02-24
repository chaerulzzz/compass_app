import 'package:freezed_annotation/freezed_annotation.dart';

part 'itinerary_config.freezed.dart';
part 'itinerary_config.g.dart';

@freezed
class ItineraryConfig with _$ItineraryConfig {
  const factory ItineraryConfig({
    /// Nama benua
    String? continent,

    /// Check in dari itinerary
    DateTime? startDate,

    /// Check out dari itinerary
    DateTime? endDate,

    /// Jumlah tamu
    int? guests,

    /// referensi tujuan itinerary
    String? destination,

    /// referensi aktivitas yg dipilih
    @Default([]) List<String> activities
  }) = _ItineraryConfig;

  factory ItineraryConfig.fromJson(Map<String, Object?> json) =>
      _$ItineraryConfigFromJson(json);
}