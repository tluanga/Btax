// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// class SpecificUserFollowButton extends HookConsumerWidget {
//   const SpecificUserFollowButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final follow = ref.watch(specificUserControllerProvider).value;
//     return SizedBox(
//         height: 32,
//         child: MaterialButton(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//             minWidth: MediaQuery.of(context).size.width,
//             color: Colors.green,
//             onPressed: () {
//               print('===============');
//               follow!.followers.contains(
//                       ref.watch(authStateControllerProvider).value!.uid)
//                   ? ref
//                       .read(specificUserControllerProvider.notifier)
//                       .unfollowUser()
//                   : ref
//                       .read(specificUserControllerProvider.notifier)
//                       .followUser();
//             },
//             child: follow!.followers
//                     .contains(ref.watch(authStateControllerProvider).value!.uid)
//                 ? Text(
//                     'Unfollow',
//                     style: TextStyle(color: Colors.grey.shade200),
//                   )
//                 : Text(
//                     'Follow',
//                     style: TextStyle(color: Colors.grey.shade200),
//                   )));
//   }
// }
