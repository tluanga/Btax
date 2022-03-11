import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String dateOfRegistration,
    required String userEmail,
    required String userId,
    required String userFirstName,
    required String userLastName,
    required String userPhone,
    required String userAddress,
    required String userIDVerificatinType,
    required String userBusinessName,
    required String userBusinessType,
    required int userTotalSalesAmount,
    required bool doesSalesIncledeGST,
    required String userGSTOnSales,
    required String userGSTOnPurchases,
    required String userABNNo,
    required String userGSTAcMethod,
    required bool doesUserHaveEmployees,
    required int totalSalryOfEmployees,
    required int totalAmountWidthdraw,
    required String userDOB,
    required int payableAmount,
    required String paymentMethod,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
