import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

enum TimeOfDay { any, morning, afternoon, evening, night }

@freezed
class Activity with _$Activity {
  const factory Activity(
      {
      // Contoh: 'Pendakian gunung merapi'
      required String name,

      //Contoh: 'Ayo kita mendaki bersama sama ke merapi'
      required String description,

      //Contoh: 'Gunung Merapi'
      required String locationName,

      //Durasi dalam perhitungan hari
      required int duration,

      //Contoh: morning
      required TimeOfDay timeOfDay,

      //True or false
      required bool familyFriendly,

      //Harga
      required int price,

      //ref tempat tujuan
      required String destinationRef,

      //ref tempat
      required String ref,

      //Gambar tempat tujuan
      required String imageUrl}) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json) =>
      _$ActivityFromJson(json);
}
