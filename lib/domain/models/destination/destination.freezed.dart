// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'destination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Destination _$DestinationFromJson(Map<String, dynamic> json) {
  return _Destination.fromJson(json);
}

/// @nodoc
mixin _$Destination {
  /// Contoh: 'jakarta'
  String get ref => throw _privateConstructorUsedError;

  /// Contoh 'Jakarta'
  String get name => throw _privateConstructorUsedError;

  /// Contoh 'Indonesia'
  String get country => throw _privateConstructorUsedError;

  /// Contoh 'Asia'
  String get continent => throw _privateConstructorUsedError;

  /// Contoh 'Jakarta terkenal karena macetnya'
  String get knownFor => throw _privateConstructorUsedError;

  /// Contoh ['Hotel Indonesia', 'Monas']
  List<String> get tags => throw _privateConstructorUsedError;

  /// Contoh 'https://storage.googleapis.com/tripedia-images/destinations/alaska.jpg'
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this Destination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Destination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DestinationCopyWith<Destination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestinationCopyWith<$Res> {
  factory $DestinationCopyWith(
          Destination value, $Res Function(Destination) then) =
      _$DestinationCopyWithImpl<$Res, Destination>;
  @useResult
  $Res call(
      {String ref,
      String name,
      String country,
      String continent,
      String knownFor,
      List<String> tags,
      String imageUrl});
}

/// @nodoc
class _$DestinationCopyWithImpl<$Res, $Val extends Destination>
    implements $DestinationCopyWith<$Res> {
  _$DestinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Destination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? name = null,
    Object? country = null,
    Object? continent = null,
    Object? knownFor = null,
    Object? tags = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      continent: null == continent
          ? _value.continent
          : continent // ignore: cast_nullable_to_non_nullable
              as String,
      knownFor: null == knownFor
          ? _value.knownFor
          : knownFor // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DestinationImplCopyWith<$Res>
    implements $DestinationCopyWith<$Res> {
  factory _$$DestinationImplCopyWith(
          _$DestinationImpl value, $Res Function(_$DestinationImpl) then) =
      __$$DestinationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ref,
      String name,
      String country,
      String continent,
      String knownFor,
      List<String> tags,
      String imageUrl});
}

/// @nodoc
class __$$DestinationImplCopyWithImpl<$Res>
    extends _$DestinationCopyWithImpl<$Res, _$DestinationImpl>
    implements _$$DestinationImplCopyWith<$Res> {
  __$$DestinationImplCopyWithImpl(
      _$DestinationImpl _value, $Res Function(_$DestinationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Destination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? name = null,
    Object? country = null,
    Object? continent = null,
    Object? knownFor = null,
    Object? tags = null,
    Object? imageUrl = null,
  }) {
    return _then(_$DestinationImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      continent: null == continent
          ? _value.continent
          : continent // ignore: cast_nullable_to_non_nullable
              as String,
      knownFor: null == knownFor
          ? _value.knownFor
          : knownFor // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DestinationImpl implements _Destination {
  const _$DestinationImpl(
      {required this.ref,
      required this.name,
      required this.country,
      required this.continent,
      required this.knownFor,
      required final List<String> tags,
      required this.imageUrl})
      : _tags = tags;

  factory _$DestinationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DestinationImplFromJson(json);

  /// Contoh: 'jakarta'
  @override
  final String ref;

  /// Contoh 'Jakarta'
  @override
  final String name;

  /// Contoh 'Indonesia'
  @override
  final String country;

  /// Contoh 'Asia'
  @override
  final String continent;

  /// Contoh 'Jakarta terkenal karena macetnya'
  @override
  final String knownFor;

  /// Contoh ['Hotel Indonesia', 'Monas']
  final List<String> _tags;

  /// Contoh ['Hotel Indonesia', 'Monas']
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// Contoh 'https://storage.googleapis.com/tripedia-images/destinations/alaska.jpg'
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Destination(ref: $ref, name: $name, country: $country, continent: $continent, knownFor: $knownFor, tags: $tags, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DestinationImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.continent, continent) ||
                other.continent == continent) &&
            (identical(other.knownFor, knownFor) ||
                other.knownFor == knownFor) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ref, name, country, continent,
      knownFor, const DeepCollectionEquality().hash(_tags), imageUrl);

  /// Create a copy of Destination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DestinationImplCopyWith<_$DestinationImpl> get copyWith =>
      __$$DestinationImplCopyWithImpl<_$DestinationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DestinationImplToJson(
      this,
    );
  }
}

abstract class _Destination implements Destination {
  const factory _Destination(
      {required final String ref,
      required final String name,
      required final String country,
      required final String continent,
      required final String knownFor,
      required final List<String> tags,
      required final String imageUrl}) = _$DestinationImpl;

  factory _Destination.fromJson(Map<String, dynamic> json) =
      _$DestinationImpl.fromJson;

  /// Contoh: 'jakarta'
  @override
  String get ref;

  /// Contoh 'Jakarta'
  @override
  String get name;

  /// Contoh 'Indonesia'
  @override
  String get country;

  /// Contoh 'Asia'
  @override
  String get continent;

  /// Contoh 'Jakarta terkenal karena macetnya'
  @override
  String get knownFor;

  /// Contoh ['Hotel Indonesia', 'Monas']
  @override
  List<String> get tags;

  /// Contoh 'https://storage.googleapis.com/tripedia-images/destinations/alaska.jpg'
  @override
  String get imageUrl;

  /// Create a copy of Destination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DestinationImplCopyWith<_$DestinationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
