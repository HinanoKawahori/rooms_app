import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../functions/time_stamp_converter.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  factory Room({
    required String roomId,
    required String userId,
    required String location,
    required String rent,
    required String timing,
    required String type,
    required String layout,
    required String depoist,
    @TimestampConverter() Timestamp? latestMessageCreatedAt,
    @TimestampConverter() required Timestamp postedAt,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
