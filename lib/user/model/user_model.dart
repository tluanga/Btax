import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String bio,
    required String dateOfRegistration,
    required List followers,
    required List following,
    required String profileUrl,
    required String status,
    required bool sticked,
    required String userEmail,
    required String userId,
    required String userName,
    required String userPhone,
    required String userType,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
