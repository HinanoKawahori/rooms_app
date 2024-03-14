import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../functions/time_stamp_converter.dart';
part 'user_account.freezed.dart';
part 'user_account.g.dart';

@freezed
class UserAccount with _$UserAccount {
  factory UserAccount({
    required String email,
    required String userId,
    String? imageUrl,
    required String userName,
    String? selfIntro,
    @TimestampConverter() Timestamp? updatedAt,
    @TimestampConverter() required Timestamp createdAt,
  }) = _UserAccount;

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);
}
