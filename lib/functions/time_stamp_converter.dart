import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: library_prefixes
import 'package:timeago/timeago.dart' as timeAgo;

class TimestampConverter implements JsonConverter<Timestamp, Timestamp> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Timestamp timestamp) {
    return timestamp;
  }

  @override
  Timestamp toJson(Timestamp date) => date;
}

String createTimeAgoString(DateTime postDateTime) {
  final now = DateTime.now();
  // final formattedTime = DateFormat('HH:mm', curry)
  final difference = now.difference(postDateTime);
  return timeAgo.format(now.subtract(difference), locale: "ja");
}

String convertTimestampToRelativeTime(Timestamp timestamp) {
  final DateTime dateTime = timestamp.toDate();
  final Duration difference = DateTime.now().difference(dateTime);
  final int sec = difference.inSeconds;

  if (sec >= 60 * 60 * 24) {
    return '${difference.inDays.toString()}日前';
  } else if (sec >= 60 * 60) {
    return '${difference.inHours.toString()}時間前';
  } else if (sec >= 60) {
    return '${difference.inMinutes.toString()}分前';
  } else {
    return '$sec秒前';
  }
}
