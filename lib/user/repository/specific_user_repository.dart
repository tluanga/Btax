import 'package:btax/user/controller/specific_user_controller_provider.dart';
import 'package:btax/user/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final specificUserRepositoryProvider =
    Provider<UserRepository>((_) => UserRepository(_.read));

class UserRepository {
  final Reader _read;
  UserRepository(this._read);
  //UserModel userList = [];
  Future<UserModel?> getUser(String userId) async {
    final firebase = FirebaseFirestore.instance;

    // .where('category',isEqualTo: category).orderBy('createdAt',descending: true)
    // .limit(10).startAfterDocument(FirebaseFirestore.instance.collection('articles').doc(index.toString())).get();

    try {
      final result = await firebase
          .collection('user')
          .doc(_read(selectedAuthorIdcontrollerProvider.state).state)
          .get();
      // .where('category', isEqualTo: category)
      // .orderBy('createdAt', descending: true)
      // .limit(limit)
      // .get();
      UserModel user = UserModel(
          bio: result.data()!['bio'],
          dateOfRegistration: result.data()!['dateOfRegistration'],
          followers: result.data()!['followers'],
          following: result.data()!['following'],
          profileUrl: result.data()!['profileUrl'],
          status: result.data()!['status'],
          sticked: result.data()!['sticked'],
          userEmail: result.data()!['userEmail'],
          userId: userId,
          userName: result.data()!['userName'],
          userPhone: result.data()!['userPhone'],
          userType: result.data()!['userType']);
      print(user);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel?> followUser(String currentUserId) async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase
          .collection('user')
          .doc(_read(selectedAuthorIdcontrollerProvider.state).state)
          .update({
        'followers': FieldValue.arrayUnion([currentUserId])
      });

      //get folowers
      final result = await firebase
          .collection('user')
          .doc(_read(selectedAuthorIdcontrollerProvider.state).state)
          .get();
      UserModel user = UserModel(
          bio: result.data()!['bio'],
          dateOfRegistration: result.data()!['dateOfRegistration'],
          followers: result.data()!['followers'],
          following: result.data()!['following'],
          profileUrl: result.data()!['profileUrl'],
          status: result.data()!['status'],
          sticked: result.data()!['sticked'],
          userEmail: result.data()!['userEmail'],
          userId: _read(selectedAuthorIdcontrollerProvider.state).state,
          userName: result.data()!['userName'],
          userPhone: result.data()!['userPhone'],
          userType: result.data()!['userType']);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel?> unfollowUser(String currentUserId) async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase
          .collection('user')
          .doc(_read(selectedAuthorIdcontrollerProvider.state).state)
          .update({
        'followers': FieldValue.arrayRemove([currentUserId])
      });
      final result = await firebase
          .collection('user')
          .doc(_read(selectedAuthorIdcontrollerProvider.state).state)
          .get();
      UserModel user = UserModel(
          bio: result.data()!['bio'],
          dateOfRegistration: result.data()!['dateOfRegistration'],
          followers: result.data()!['followers'],
          following: result.data()!['following'],
          profileUrl: result.data()!['profileUrl'],
          status: result.data()!['status'],
          sticked: result.data()!['sticked'],
          userEmail: result.data()!['userEmail'],
          userId: _read(selectedAuthorIdcontrollerProvider.state).state,
          userName: result.data()!['userName'],
          userPhone: result.data()!['userPhone'],
          userType: result.data()!['userType']);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
