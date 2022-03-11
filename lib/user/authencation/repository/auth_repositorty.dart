import 'package:btax/user/authencation/widget/clean_text.dart';
import 'package:btax/user/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChange => _auth.authStateChanges();
  Future<void> anonymousSignIn(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error Occured'),
          content: cleanText(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  //  SigIn the user using Email and Password
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error Occured'),
          content: cleanText(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  // SignUp the user using Email and Password
  Future signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .whenComplete(() => null);
      return userCredential.user!.uid;

      ///
      // UserModel userModel = UserModel(

      //   userPhone: '',
      //   userEmail: email,
      //   dateOfRegistration: DateTime.now().toString(),

      //   userId: userCredential.user!.uid,

      // );

//add user to firestore
      // await FirebaseFirestore.instance
      //     .collection('user')
      //     .doc(userCredential.user!.uid)
      //     .set(userModel.toJson());

      ///
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                  title: const Text('Error Occured'),
                  content: Text(e
                      .toString()
                      .replaceAll('[firebase_auth/wrong-password]', '')),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text("OK"))
                  ]));
    } catch (e) {
      if (e == 'email-already-in-use') {
        print('Email already in use.');
      } else {
        return '';
      }
    }

    //  SignIn the user Google
    // Future<void> signInWithGoogle(BuildContext context) async {
    //   // Trigger the authentication flow
    //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //   // Obtain the auth details from the request
    //   final GoogleSignInAuthentication googleAuth =
    //       await googleUser!.authentication;

    //   // Create a new credential
    //   final credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth.accessToken,
    //     idToken: googleAuth.idToken,
    //   );

    //   try {
    //     await _auth.signInWithCredential(credential);
    //   } on FirebaseAuthException catch (e) {
    //     await showDialog(
    //       context: context,
    //       builder: (ctx) => AlertDialog(
    //         title: const Text('Error Occured'),
    //         content: Text(e.toString()),
    //         actions: [
    //           TextButton(
    //               onPressed: () {
    //                 Navigator.of(ctx).pop();
    //               },
    //               child: const Text("OK"))
    //         ],
    //       ),
    //     );
    //   }
    // }

    //  SignOut the current user
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> uploadUserProfile(UserModel userModel) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
