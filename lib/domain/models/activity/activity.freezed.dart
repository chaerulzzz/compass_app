// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return _Activity.fromJson(json);
}

/// @nodoc
mixin _$Activity {
// Contoh: 'Pendakian gunung merapi'
  String get name =>
      throw _privateConstructorUsedError; //Contoh: 'Ayo kita mendaki bersama sama ke merapi'
  String get description =>
      throw _privateConstructorUsedError; //Contoh: 'Gunung Merapi'
  String get locationName =>
      throw _privateConstructorUsedError; //Durasi dalam perhitungan hari
  int get duration => throw _privateConstructorUsedError; //Contoh: morning
  TimeOfDay get timeOfDay => throw _privateConstructorUsedError; //True or false
  bool get familyFriendly => throw _privateConstructorUsedError; //Harga
  int get price => throw _privateConstructorUsedError; //ref tempat tujuan
  String get destinationRef => throw _privateConstructorUsedError; //ref tempat
  String get ref => throw _privateConstructorUsedError; //Gambar tempat tujuan
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this Activity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res, Activity>;
  @useResult
  $Res call(
      {String name,
      String description,
      String locationName,
      int duration,
      TimeOfDay timeOfDay,
      bool familyFriendly,
      int price,
      String destinationRef,
      String ref,
      String imageUrl});
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res, $Val extends Activity>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? locationName = null,
    Object? duration = null,
    Object? timeOfDay = null,
    Object? familyFriendly = null,
    Object? price = null,
    Object? destinationRef = null,
    Object? ref = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      timeOfDay: null == timeOfDay
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      familyFriendly: null == familyFriendly
          ? _value.familyFriendly
          : familyFriendly // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      destinationRef: null == destinationRef
          ? _value.destinationRef
          : destinationRef // ignore: cast_nullable_to_non_nullable
              as String,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityImplCopyWith<$Res>
    implements $ActivityCopyWith<$Res> {
  factory _$$ActivityImplCopyWith(
          _$ActivityImpl value, $Res Function(_$ActivityImpl) then) =
      __$$ActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String locationName,
      int duration,
      TimeOfDay timeOfDay,
      bool familyFriendly,
      int price,
      String destinationRef,
      String ref,
      String imageUrl});
}

/// @nodoc
class __$$ActivityImplCopyWithImpl<$Res>
    extends _$ActivityCopyWithImpl<$Res, _$ActivityImpl>
    implements _$$ActivityImplCopyWith<$Res> {
  __$$ActivityImplCopyWithImpl(
      _$ActivityImpl _value, $Res Function(_$ActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? locationName = null,
    Object? duration = null,
    Object? timeOfDay = null,
    Object? familyFriendly = null,
    Object? price = null,
    Object? destinationRef = null,
    Object? ref = null,
    Object? imageUrl = null,
  }) {
    return _then(_$ActivityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      timeOfDay: null == timeOfDay
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      familyFriendly: null == familyFriendly
          ? _value.familyFriendly
          : familyFriendly // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      destinationRef: null == destinationRef
          ? _value.destinationRef
          : destinationRef // ignore: cast_nullable_to_non_nullable
              as String,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityImpl implements _Activity {
  const _$ActivityImpl(
      {required this.name,
      required this.description,
      required this.locationName,
      required this.duration,
      required this.timeOfDay,
      required this.familyFriendly,
      required this.price,
      required this.destinationRef,
      required this.ref,
      required this.imageUrl});

  factory _$ActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityImplFromJson(json);

// Contoh: 'Pendakian gunung merapi'
  @override
  final String name;
//Contoh: 'Ayo kita mendaki bersama sama ke merapi'
  @override
  final String description;
//Contoh: 'Gunung Merapi'
  @override
  final String locationName;
//Durasi dalam perhitungan hari
  @override
  final int duration;
//Contoh: morning
  @override
  final TimeOfDay timeOfDay;
//True or false
  @override
  final bool familyFriendly;
//Harga
  @override
  final int price;
//ref tempat tujuan
  @override
  final String destinationRef;
//ref tempat
  @override
  final String ref;
//Gambar tempat tujuan
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Activity(name: $name, description: $description, locationName: $locationName, duration: $duration, timeOfDay: $timeOfDay, familyFriendly: $familyFriendly, price: $price, destinationRef: $destinationRef, ref: $ref, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.timeOfDay, timeOfDay) ||
                other.timeOfDay == timeOfDay) &&
            (identical(other.familyFriendly, familyFriendly) ||
                other.familyFriendly == familyFriendly) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.destinationRef, destinationRef) ||
                other.destinationRef == destinationRef) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      locationName,
      duration,
      timeOfDay,
      familyFriendly,
      price,
      destinationRef,
      ref,
      imageUrl);

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      __$$ActivityImplCopyWithImpl<_$ActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityImplToJson(
      this,
    );
  }
}

abstract class _Activity implements Activity {
  const factory _Activity(
      {required final String name,
      required final String description,
      required final String locationName,
      required final int duration,
      required final TimeOfDay timeOfDay,
      required final bool familyFriendly,
      required final int price,
      required final String destinationRef,
      required final String ref,
      required final String imageUrl}) = _$ActivityImpl;

  factory _Activity.fromJson(Map<String, dynamic> json) =
      _$ActivityImpl.fromJson;

// Contoh: 'Pendakian gunung merapi'
  @override
  String get name; //Contoh: 'Ayo kita mendaki bersama sama ke merapi'
  @override
  String get description; //Contoh: 'Gunung Merapi'
  @override
  String get locationName; //Durasi dalam perhitungan hari
  @override
  int get duration; //Contoh: morning
  @override
  TimeOfDay get timeOfDay; //True or false
  @override
  bool get familyFriendly; //Harga
  @override
  int get price; //ref tempat tujuan
  @override
  String get destinationRef; //ref tempat
  @override
  String get ref; //Gambar tempat tujuan
  @override
  String get imageUrl;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
