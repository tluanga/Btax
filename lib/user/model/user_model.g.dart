// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      dateOfRegistration: json['dateOfRegistration'] as String,
      userEmail: json['userEmail'] as String,
      userId: json['userId'] as String,
      userFirstName: json['userFirstName'] as String,
      userLastName: json['userLastName'] as String,
      userPhone: json['userPhone'] as String,
      userAddress: json['userAddress'] as String,
      userIDVerificatinType: json['userIDVerificatinType'] as String,
      userBusinessName: json['userBusinessName'] as String,
      userBusinessType: json['userBusinessType'] as String,
      userTotalSalesAmount: json['userTotalSalesAmount'] as int,
      doesSalesIncledeGST: json['doesSalesIncledeGST'] as bool,
      userGSTOnSales: json['userGSTOnSales'] as String,
      userGSTOnPurchases: json['userGSTOnPurchases'] as String,
      userABNNo: json['userABNNo'] as String,
      userGSTAcMethod: json['userGSTAcMethod'] as String,
      doesUserHaveEmployees: json['doesUserHaveEmployees'] as bool,
      totalSalryOfEmployees: json['totalSalryOfEmployees'] as int,
      totalAmountWidthdraw: json['totalAmountWidthdraw'] as int,
      userDOB: json['userDOB'] as String,
      payableAmount: json['payableAmount'] as int,
      paymentMethod: json['paymentMethod'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'dateOfRegistration': instance.dateOfRegistration,
      'userEmail': instance.userEmail,
      'userId': instance.userId,
      'userFirstName': instance.userFirstName,
      'userLastName': instance.userLastName,
      'userPhone': instance.userPhone,
      'userAddress': instance.userAddress,
      'userIDVerificatinType': instance.userIDVerificatinType,
      'userBusinessName': instance.userBusinessName,
      'userBusinessType': instance.userBusinessType,
      'userTotalSalesAmount': instance.userTotalSalesAmount,
      'doesSalesIncledeGST': instance.doesSalesIncledeGST,
      'userGSTOnSales': instance.userGSTOnSales,
      'userGSTOnPurchases': instance.userGSTOnPurchases,
      'userABNNo': instance.userABNNo,
      'userGSTAcMethod': instance.userGSTAcMethod,
      'doesUserHaveEmployees': instance.doesUserHaveEmployees,
      'totalSalryOfEmployees': instance.totalSalryOfEmployees,
      'totalAmountWidthdraw': instance.totalAmountWidthdraw,
      'userDOB': instance.userDOB,
      'payableAmount': instance.payableAmount,
      'paymentMethod': instance.paymentMethod,
    };
