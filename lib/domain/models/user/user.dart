import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    /// Nama User
    required String name,

    /// Url Gambar User
    required String picture
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}