import 'package:freezed_annotation/freezed_annotation.dart';

part 'continent.freezed.dart';
part 'continent.g.dart';

@freezed
class Continent with _$Continent {
  const factory Continent({
    /// Contoh 'Asia'
    required String name,

    /// Url untuk gambar benua
    required String imageUrl
  }) = _Continent;

  factory Continent.fromJson(Map<String, Object?> json) =>
      _$ContinentFromJson(json);
}