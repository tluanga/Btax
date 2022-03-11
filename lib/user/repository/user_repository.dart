import 'package:btax/user/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider =
    Provider<UserRepository>((_) => UserRepository(_.read));

class UserRepository {
  final Reader _read;
  UserRepository(this._read);
  List<UserModel> userList = [];
  Future<List<UserModel>> getUser(int limit) async {
    final firebase = FirebaseFirestore.instance;

    // .where('category',isEqualTo: category).orderBy('createdAt',descending: true)
    // .limit(10).startAfterDocument(FirebaseFirestore.instance.collection('articles').doc(index.toString())).get();
    try {
      final result = await firebase.collection('user').get();
      // .where('category', isEqualTo: category)
      // .orderBy('createdAt', descending: true)
      // .limit(limit)
      // .get();
      userList = result.docs.map((doc) {
        return UserModel.fromJson(doc.data());
      }).toList();
      return userList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
