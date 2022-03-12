import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:btax/user/authencation/controller/auth_controller.dart';
import 'package:btax/user/controller/user_controller_provider.dart';
import 'package:btax/user/ui/widget/user_profile_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfileScreen extends HookConsumerWidget {
//final String userId;
  final String heroTag;
  const UserProfileScreen(this.heroTag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final u = ref.watch(authStateControllerProvider);
    final userProfile = ref.watch(userControllerProvider);

    return u.when(
      data: (data) => Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: userProfile.when(
            data: (user) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: 40,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              ref.read(authenticationProvider).signOut();
                            },
                            child: const Text('Logout'))),
                    Icon(
                      Icons.person_rounded,
                      size: 80,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(height: 16),
                    userProfileText(user.userFirstName, 'FirstName'),
                    userProfileText(user.userLastName, 'LastName'),
                    userProfileText(user.userEmail, 'Email'),
                    userProfileText(user.userPhone, 'Phone Number'),
                    userProfileText(user.userAddress, 'Address'),
                    userProfileText(user.userBusinessName, 'Business Name'),
                  ],
                ),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (context, error) {
              return Center(
                child: Text(error.toString()),
              );
            },
          ),
        ),
      )),
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (context, error) {
        return Center(
          child: Text(error.toString()),
        );
      },
    );
  }

  Widget bio(String bio) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 20),
      child: Text(
        bio,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
