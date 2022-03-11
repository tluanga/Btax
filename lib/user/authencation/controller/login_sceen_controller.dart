import 'package:btax/user/authencation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginScreenController =
    StateProvider<Widget>((ref) => const LoginScreen());
