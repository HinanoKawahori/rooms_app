// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  String get roomId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get rent => throw _privateConstructorUsedError;
  String get timing => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get layout => throw _privateConstructorUsedError;
  String get depoist => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get latestMessageCreatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get postedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call(
      {String roomId,
      String userId,
      String location,
      String rent,
      String timing,
      String type,
      String layout,
      String depoist,
      @TimestampConverter() Timestamp? latestMessageCreatedAt,
      @TimestampConverter() Timestamp postedAt});
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
    Object? location = null,
    Object? rent = null,
    Object? timing = null,
    Object? type = null,
    Object? layout = null,
    Object? depoist = null,
    Object? latestMessageCreatedAt = freezed,
    Object? postedAt = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      rent: null == rent
          ? _value.rent
          : rent // ignore: cast_nullable_to_non_nullable
              as String,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as String,
      depoist: null == depoist
          ? _value.depoist
          : depoist // ignore: cast_nullable_to_non_nullable
              as String,
      latestMessageCreatedAt: freezed == latestMessageCreatedAt
          ? _value.latestMessageCreatedAt
          : latestMessageCreatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      postedAt: null == postedAt
          ? _value.postedAt
          : postedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
          _$RoomImpl value, $Res Function(_$RoomImpl) then) =
      __$$RoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomId,
      String userId,
      String location,
      String rent,
      String timing,
      String type,
      String layout,
      String depoist,
      @TimestampConverter() Timestamp? latestMessageCreatedAt,
      @TimestampConverter() Timestamp postedAt});
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$RoomCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
    Object? location = null,
    Object? rent = null,
    Object? timing = null,
    Object? type = null,
    Object? layout = null,
    Object? depoist = null,
    Object? latestMessageCreatedAt = freezed,
    Object? postedAt = null,
  }) {
    return _then(_$RoomImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      rent: null == rent
          ? _value.rent
          : rent // ignore: cast_nullable_to_non_nullable
              as String,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as String,
      depoist: null == depoist
          ? _value.depoist
          : depoist // ignore: cast_nullable_to_non_nullable
              as String,
      latestMessageCreatedAt: freezed == latestMessageCreatedAt
          ? _value.latestMessageCreatedAt
          : latestMessageCreatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      postedAt: null == postedAt
          ? _value.postedAt
          : postedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomImpl implements _Room {
  _$RoomImpl(
      {required this.roomId,
      required this.userId,
      required this.location,
      required this.rent,
      required this.timing,
      required this.type,
      required this.layout,
      required this.depoist,
      @TimestampConverter() this.latestMessageCreatedAt,
      @TimestampConverter() required this.postedAt});

  factory _$RoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomImplFromJson(json);

  @override
  final String roomId;
  @override
  final String userId;
  @override
  final String location;
  @override
  final String rent;
  @override
  final String timing;
  @override
  final String type;
  @override
  final String layout;
  @override
  final String depoist;
  @override
  @TimestampConverter()
  final Timestamp? latestMessageCreatedAt;
  @override
  @TimestampConverter()
  final Timestamp postedAt;

  @override
  String toString() {
    return 'Room(roomId: $roomId, userId: $userId, location: $location, rent: $rent, timing: $timing, type: $type, layout: $layout, depoist: $depoist, latestMessageCreatedAt: $latestMessageCreatedAt, postedAt: $postedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.rent, rent) || other.rent == rent) &&
            (identical(other.timing, timing) || other.timing == timing) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            (identical(other.depoist, depoist) || other.depoist == depoist) &&
            (identical(other.latestMessageCreatedAt, latestMessageCreatedAt) ||
                other.latestMessageCreatedAt == latestMessageCreatedAt) &&
            (identical(other.postedAt, postedAt) ||
                other.postedAt == postedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, userId, location, rent,
      timing, type, layout, depoist, latestMessageCreatedAt, postedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      __$$RoomImplCopyWithImpl<_$RoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomImplToJson(
      this,
    );
  }
}

abstract class _Room implements Room {
  factory _Room(
      {required final String roomId,
      required final String userId,
      required final String location,
      required final String rent,
      required final String timing,
      required final String type,
      required final String layout,
      required final String depoist,
      @TimestampConverter() final Timestamp? latestMessageCreatedAt,
      @TimestampConverter() required final Timestamp postedAt}) = _$RoomImpl;

  factory _Room.fromJson(Map<String, dynamic> json) = _$RoomImpl.fromJson;

  @override
  String get roomId;
  @override
  String get userId;
  @override
  String get location;
  @override
  String get rent;
  @override
  String get timing;
  @override
  String get type;
  @override
  String get layout;
  @override
  String get depoist;
  @override
  @TimestampConverter()
  Timestamp? get latestMessageCreatedAt;
  @override
  @TimestampConverter()
  Timestamp get postedAt;
  @override
  @JsonKey(ignore: true)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
