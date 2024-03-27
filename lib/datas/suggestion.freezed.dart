// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Suggestion _$SuggestionFromJson(Map<String, dynamic> json) {
  return _Suggestion.fromJson(json);
}

/// @nodoc
mixin _$Suggestion {
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get latestMessageCreatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get postedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestionCopyWith<Suggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionCopyWith<$Res> {
  factory $SuggestionCopyWith(
          Suggestion value, $Res Function(Suggestion) then) =
      _$SuggestionCopyWithImpl<$Res, Suggestion>;
  @useResult
  $Res call(
      {String userId,
      String title,
      String message,
      @TimestampConverter() Timestamp? latestMessageCreatedAt,
      @TimestampConverter() Timestamp postedAt});
}

/// @nodoc
class _$SuggestionCopyWithImpl<$Res, $Val extends Suggestion>
    implements $SuggestionCopyWith<$Res> {
  _$SuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? title = null,
    Object? message = null,
    Object? latestMessageCreatedAt = freezed,
    Object? postedAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SuggestionImplCopyWith<$Res>
    implements $SuggestionCopyWith<$Res> {
  factory _$$SuggestionImplCopyWith(
          _$SuggestionImpl value, $Res Function(_$SuggestionImpl) then) =
      __$$SuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String title,
      String message,
      @TimestampConverter() Timestamp? latestMessageCreatedAt,
      @TimestampConverter() Timestamp postedAt});
}

/// @nodoc
class __$$SuggestionImplCopyWithImpl<$Res>
    extends _$SuggestionCopyWithImpl<$Res, _$SuggestionImpl>
    implements _$$SuggestionImplCopyWith<$Res> {
  __$$SuggestionImplCopyWithImpl(
      _$SuggestionImpl _value, $Res Function(_$SuggestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? title = null,
    Object? message = null,
    Object? latestMessageCreatedAt = freezed,
    Object? postedAt = null,
  }) {
    return _then(_$SuggestionImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
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
class _$SuggestionImpl implements _Suggestion {
  _$SuggestionImpl(
      {required this.userId,
      required this.title,
      required this.message,
      @TimestampConverter() this.latestMessageCreatedAt,
      @TimestampConverter() required this.postedAt});

  factory _$SuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionImplFromJson(json);

  @override
  final String userId;
  @override
  final String title;
  @override
  final String message;
  @override
  @TimestampConverter()
  final Timestamp? latestMessageCreatedAt;
  @override
  @TimestampConverter()
  final Timestamp postedAt;

  @override
  String toString() {
    return 'Suggestion(userId: $userId, title: $title, message: $message, latestMessageCreatedAt: $latestMessageCreatedAt, postedAt: $postedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.latestMessageCreatedAt, latestMessageCreatedAt) ||
                other.latestMessageCreatedAt == latestMessageCreatedAt) &&
            (identical(other.postedAt, postedAt) ||
                other.postedAt == postedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, title, message, latestMessageCreatedAt, postedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionImplCopyWith<_$SuggestionImpl> get copyWith =>
      __$$SuggestionImplCopyWithImpl<_$SuggestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionImplToJson(
      this,
    );
  }
}

abstract class _Suggestion implements Suggestion {
  factory _Suggestion(
          {required final String userId,
          required final String title,
          required final String message,
          @TimestampConverter() final Timestamp? latestMessageCreatedAt,
          @TimestampConverter() required final Timestamp postedAt}) =
      _$SuggestionImpl;

  factory _Suggestion.fromJson(Map<String, dynamic> json) =
      _$SuggestionImpl.fromJson;

  @override
  String get userId;
  @override
  String get title;
  @override
  String get message;
  @override
  @TimestampConverter()
  Timestamp? get latestMessageCreatedAt;
  @override
  @TimestampConverter()
  Timestamp get postedAt;
  @override
  @JsonKey(ignore: true)
  _$$SuggestionImplCopyWith<_$SuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
