import 'package:freezed_annotation/freezed_annotation.dart';

part 'destination.freezed.dart';
part 'destination.g.dart';

@freezed
class Destination with _$Destination {
  const factory Destination({
    /// Contoh: 'jakarta'
    required String ref,

    /// Contoh 'Jakarta'
    required String name,

    /// Contoh 'Indonesia'
    required String country,

    /// Contoh 'Asia'
    required String continent,

    /// Contoh 'Jakarta terkenal karena macetnya'
    required String knownFor,

    /// Contoh ['Hotel Indonesia', 'Monas']
    required List<String> tags,

    /// Contoh 'https://storage.googleapis.com/tripedia-images/destinations/alaska.jpg'
    required String imageUrl
  }) = _Destination;

  factory Destination.fromJson(Map<String, Object?> json) =>
      _$DestinationFromJson(json);
}