// ignore_for_file: avoid_print

import 'package:btax/user/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider =
    Provider<UserRepository>((_) => UserRepository(_.read));

class UserRepository {
  final Reader _read;
  UserRepository(this._read);

  Future<UserModel> getUser(String userId) async {
    final firebase = FirebaseFirestore.instance;

    // .where('category',isEqualTo: category).orderBy('createdAt',descending: true)
    // .limit(10).startAfterDocument(FirebaseFirestore.instance.collection('articles').doc(index.toString())).get();
    try {
      final result = await firebase.collection('user').doc(userId).get();

      // .where('category', isEqualTo: category)
      // .orderBy('createdAt', descending: true)
      // .limit(limit)
      // .get();
      print(result.data()!['userEmail']);
      UserModel user = UserModel(
          dateOfRegistration: result.data()!['dateOfRegistration'],
          userEmail: result.data()!['userEmail'],
          userId: userId,
          userFirstName: result.data()!['userFirstName'],
          userLastName: result.data()!['userLastName'],
          userPhone: result.data()!['userPhone'],
          userAddress: result.data()!['userAddress'],
          userIDVerificatinType: '',
          userBusinessName: result.data()!['userBusinessName'],
          userBusinessType: '',
          userTotalSalesAmount: 0,
          doesSalesIncledeGST: false,
          userGSTOnSales: '',
          userGSTOnPurchases: '',
          userABNNo: '',
          userGSTAcMethod: '',
          doesUserHaveEmployees: false,
          totalSalryOfEmployees: 0,
          totalAmountWidthdraw: 0,
          userDOB: result.data()!['userDOB'],
          payableAmount: 0,
          paymentMethod: result.data()!['paymentMethod']);
      return user;
    } catch (e) {
      print(e);
      return UserModel(
          dateOfRegistration: '',
          userEmail: '',
          userId: userId,
          userFirstName: '',
          userLastName: '',
          userPhone: '',
          userAddress: '',
          userIDVerificatinType: 'userIDVerificatinType',
          userBusinessName: 'userBusinessName',
          userBusinessType: 'userBusinessType',
          userTotalSalesAmount: 0,
          doesSalesIncledeGST: false,
          userGSTOnSales: 'userGSTOnSales',
          userGSTOnPurchases: 'userGSTOnPurchases',
          userABNNo: '0',
          userGSTAcMethod: 'd',
          doesUserHaveEmployees: false,
          totalSalryOfEmployees: 0,
          totalAmountWidthdraw: 0,
          userDOB: '',
          payableAmount: 0,
          paymentMethod: '');
    }
  }

  uploadUserProfile(UserModel user) async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection('user').doc(user.userId).set(user.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
