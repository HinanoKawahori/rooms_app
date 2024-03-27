import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../functions/time_stamp_converter.dart';

part 'suggestion.freezed.dart';
part 'suggestion.g.dart';

@freezed
class Suggestion with _$Suggestion {
  factory Suggestion({
    required String userId,
    required String title,
    required String message,
    @TimestampConverter() Timestamp? latestMessageCreatedAt,
    @TimestampConverter() required Timestamp postedAt,
  }) = _Suggestion;

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);
}
