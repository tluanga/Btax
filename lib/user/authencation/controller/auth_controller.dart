import 'package:btax/user/authencation/repository/auth_repositorty.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateControllerProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authStateChange;
});
final authenticationProvider = Provider<Authentication>((ref) {
  return Authentication();
});
final userCredentialIdProvider = StateProvider<String>((ref) => "");
