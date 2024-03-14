// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAccountImpl _$$UserAccountImplFromJson(Map<String, dynamic> json) =>
    _$UserAccountImpl(
      email: json['email'] as String,
      userId: json['userId'] as String,
      imageUrl: json['imageUrl'] as String?,
      userName: json['userName'] as String,
      selfIntro: json['selfIntro'] as String?,
      updatedAt: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['updatedAt'], const TimestampConverter().fromJson),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$UserAccountImplToJson(_$UserAccountImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'userId': instance.userId,
      'imageUrl': instance.imageUrl,
      'userName': instance.userName,
      'selfIntro': instance.selfIntro,
      'updatedAt': _$JsonConverterToJson<Timestamp, Timestamp>(
          instance.updatedAt, const TimestampConverter().toJson),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
