// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      bio: json['bio'] as String,
      dateOfRegistration: json['dateOfRegistration'] as String,
      followers: json['followers'] as List<dynamic>,
      following: json['following'] as List<dynamic>,
      profileUrl: json['profileUrl'] as String,
      status: json['status'] as String,
      sticked: json['sticked'] as bool,
      userEmail: json['userEmail'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userPhone: json['userPhone'] as String,
      userType: json['userType'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'dateOfRegistration': instance.dateOfRegistration,
      'followers': instance.followers,
      'following': instance.following,
      'profileUrl': instance.profileUrl,
      'status': instance.status,
      'sticked': instance.sticked,
      'userEmail': instance.userEmail,
      'userId': instance.userId,
      'userName': instance.userName,
      'userPhone': instance.userPhone,
      'userType': instance.userType,
    };
