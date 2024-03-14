// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) {
  return _UserAccount.fromJson(json);
}

/// @nodoc
mixin _$UserAccount {
  String get email => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get selfIntro => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get updatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAccountCopyWith<UserAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountCopyWith<$Res> {
  factory $UserAccountCopyWith(
          UserAccount value, $Res Function(UserAccount) then) =
      _$UserAccountCopyWithImpl<$Res, UserAccount>;
  @useResult
  $Res call(
      {String email,
      String userId,
      String? imageUrl,
      String userName,
      String? selfIntro,
      @TimestampConverter() Timestamp? updatedAt,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class _$UserAccountCopyWithImpl<$Res, $Val extends UserAccount>
    implements $UserAccountCopyWith<$Res> {
  _$UserAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? userId = null,
    Object? imageUrl = freezed,
    Object? userName = null,
    Object? selfIntro = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      selfIntro: freezed == selfIntro
          ? _value.selfIntro
          : selfIntro // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAccountImplCopyWith<$Res>
    implements $UserAccountCopyWith<$Res> {
  factory _$$UserAccountImplCopyWith(
          _$UserAccountImpl value, $Res Function(_$UserAccountImpl) then) =
      __$$UserAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String userId,
      String? imageUrl,
      String userName,
      String? selfIntro,
      @TimestampConverter() Timestamp? updatedAt,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$UserAccountImplCopyWithImpl<$Res>
    extends _$UserAccountCopyWithImpl<$Res, _$UserAccountImpl>
    implements _$$UserAccountImplCopyWith<$Res> {
  __$$UserAccountImplCopyWithImpl(
      _$UserAccountImpl _value, $Res Function(_$UserAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? userId = null,
    Object? imageUrl = freezed,
    Object? userName = null,
    Object? selfIntro = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$UserAccountImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      selfIntro: freezed == selfIntro
          ? _value.selfIntro
          : selfIntro // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAccountImpl implements _UserAccount {
  _$UserAccountImpl(
      {required this.email,
      required this.userId,
      this.imageUrl,
      required this.userName,
      this.selfIntro,
      @TimestampConverter() this.updatedAt,
      @TimestampConverter() required this.createdAt});

  factory _$UserAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAccountImplFromJson(json);

  @override
  final String email;
  @override
  final String userId;
  @override
  final String? imageUrl;
  @override
  final String userName;
  @override
  final String? selfIntro;
  @override
  @TimestampConverter()
  final Timestamp? updatedAt;
  @override
  @TimestampConverter()
  final Timestamp createdAt;

  @override
  String toString() {
    return 'UserAccount(email: $email, userId: $userId, imageUrl: $imageUrl, userName: $userName, selfIntro: $selfIntro, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAccountImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.selfIntro, selfIntro) ||
                other.selfIntro == selfIntro) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, userId, imageUrl,
      userName, selfIntro, updatedAt, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAccountImplCopyWith<_$UserAccountImpl> get copyWith =>
      __$$UserAccountImplCopyWithImpl<_$UserAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAccountImplToJson(
      this,
    );
  }
}

abstract class _UserAccount implements UserAccount {
  factory _UserAccount(
          {required final String email,
          required final String userId,
          final String? imageUrl,
          required final String userName,
          final String? selfIntro,
          @TimestampConverter() final Timestamp? updatedAt,
          @TimestampConverter() required final Timestamp createdAt}) =
      _$UserAccountImpl;

  factory _UserAccount.fromJson(Map<String, dynamic> json) =
      _$UserAccountImpl.fromJson;

  @override
  String get email;
  @override
  String get userId;
  @override
  String? get imageUrl;
  @override
  String get userName;
  @override
  String? get selfIntro;
  @override
  @TimestampConverter()
  Timestamp? get updatedAt;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserAccountImplCopyWith<_$UserAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
