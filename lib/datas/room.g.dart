// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      roomId: json['roomId'] as String,
      userId: json['userId'] as String,
      latestMessage: json['latestMessage'] as String?,
      latestMessageCreatedAt: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['latestMessageCreatedAt'], const TimestampConverter().fromJson),
      postedAt:
          const TimestampConverter().fromJson(json['postedAt'] as Timestamp),
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'userId': instance.userId,
      'latestMessage': instance.latestMessage,
      'latestMessageCreatedAt': _$JsonConverterToJson<Timestamp, Timestamp>(
          instance.latestMessageCreatedAt, const TimestampConverter().toJson),
      'postedAt': const TimestampConverter().toJson(instance.postedAt),
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
