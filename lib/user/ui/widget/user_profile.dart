// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:inleng/user/controller/specific_user_controller_provider.dart';
// import 'package:inleng/user/model/user_model.dart';
// import 'package:inleng/user/ui/user_profile_screen.dart';

// Widget userPofile(
//   UserModel userInfo,
//   bool isOnUserProfile,
//   String heroTag,
// ) {
//   return HookConsumer(
//     builder: (BuildContext context, WidgetRef ref, Widget? child) {
//       return GestureDetector(
//         onTap: () {
//           if (isOnUserProfile == false) {
//             ref.read(selectedAuthorIdcontrollerProvider.state).state =
//                 userInfo.userId;
//             ref.watch(specificUserControllerProvider);
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (_) => UserProfileScreen(heroTag)));
//           }
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Hero(
//               tag: heroTag,
//               child: Container(
//                 alignment: Alignment.center,
//                 width: 20,
//                 height: 20,
//                 decoration: const BoxDecoration(
//                   color: Colors.grey,
//                   shape: BoxShape.circle,
//                 ),
//                 child: ExtendedImage.network(userInfo.profileUrl,
//                     fit: BoxFit.fill,
//                     cache: true,
//                     shape: BoxShape.circle,
//                     enableMemoryCache: false,
//                     clearMemoryCacheIfFailed: true,
//                     loadStateChanged: (ExtendedImageState state) {
//                   switch (state.extendedImageLoadState) {
//                     case LoadState.loading:
//                       {
//                         return const Icon(Icons.image);
//                       }
//                     case LoadState.completed:
//                       {
//                         var widget = ExtendedRawImage(
//                           image: state.extendedImageInfo?.image,
//                           fit: BoxFit.cover,
//                         );

//                         return widget;
//                       }
//                     case LoadState.failed:
//                       {
//                         return const Icon(Icons.image);
//                         // const Image(
//                         //     image: AssetImage('assets/images/_icon.png'));
//                       }
//                   }
//                 }),
//               ),
//             ),
//             const SizedBox(
//               width: 8,
//             ),
//             Text(
//               userInfo.userName,
//               style: const TextStyle(color: Colors.black),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
