// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestionImpl _$$SuggestionImplFromJson(Map<String, dynamic> json) =>
    _$SuggestionImpl(
      userId: json['userId'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      latestMessageCreatedAt: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['latestMessageCreatedAt'], const TimestampConverter().fromJson),
      postedAt:
          const TimestampConverter().fromJson(json['postedAt'] as Timestamp),
    );

Map<String, dynamic> _$$SuggestionImplToJson(_$SuggestionImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'message': instance.message,
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
