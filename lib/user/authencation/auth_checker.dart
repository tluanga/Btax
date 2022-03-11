import 'package:btax/home/ui/home_screen.dart';
import 'package:btax/user/authencation/controller/auth_controller.dart';
import 'package:btax/user/authencation/login_signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStateControllerProvider);
    return _authState.when(
        data: (data) {
          return data != null
              ? const HomeScren() //HomeScreen(data.uid)
              : const LoginSignUpScreen();
        },
        loading: () => const Scaffold(
              body: Center(child: CupertinoActivityIndicator()),
            ),
        error: (e, trace) => Text(e.toString()));
  }
}
