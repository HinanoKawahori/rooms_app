// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      roomId: json['roomId'] as String,
      userId: json['userId'] as String,
      location: json['location'] as String,
      rent: json['rent'] as String,
      timing: json['timing'] as String,
      type: json['type'] as String,
      layout: json['layout'] as String,
      depoist: json['depoist'] as String,
      latestMessageCreatedAt: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['latestMessageCreatedAt'], const TimestampConverter().fromJson),
      postedAt:
          const TimestampConverter().fromJson(json['postedAt'] as Timestamp),
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'userId': instance.userId,
      'location': instance.location,
      'rent': instance.rent,
      'timing': instance.timing,
      'type': instance.type,
      'layout': instance.layout,
      'depoist': instance.depoist,
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
