import 'package:btax/user/controller/current_user_controller_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerUserProfile extends HookConsumerWidget {
  const DrawerUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(currentUserControllerProvider);
    Widget image() {
      return CircleAvatar(
        radius: 30,
        child: userProfile.value == null
            ? const Icon(CupertinoIcons.person)
            : userProfile.value!.profileUrl != ''
                ? Image(image: NetworkImage(userProfile.value!.profileUrl))
                : Text(
                    userProfile.value!.userName[0],
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
      );
    }

// Body ----------------
    return userProfile.when(
      data: (userProfile) => Material(
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).pop();
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (_) => const UserProfileScreen('')));
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.811,
            height: 100,
            child: Center(
              child: ListTile(
                leading: image(),
                title: Text(
                  userProfile.userName,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  userProfile.userEmail,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      loading: () => ListTile(
        leading: image(),
        title: const Text('Loading...'),
      ),
      error: (e, _) => ListTile(
        leading: image(),
        title: const Text('Error'),
      ),
    );
  }
}
