// import 'package:btax/user/controller/specific_user_controller_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// class UserProfileScreen extends HookConsumerWidget {
// //final String userId;
//   final String heroTag;
//   const UserProfileScreen(this.heroTag, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userProfile = ref.watch(specificUserControllerProvider);

//     final buttonState = useState([true, false]);
//    // ref.watch(articleByAuthorControllerProvider);
//     Widget bottom() {
//       return Padding(
//         padding: const EdgeInsets.only(left: 14.0),
//         child: Row(
//           children: [
//             GestureDetector(
//               onTap: (() {
//                 buttonState.value = [true, false];
//               }),
//               child: tapBarButton(
//                 buttonState.value.first,
//                 'Articles',
//               ),
//             ),
//             const SizedBox(
//               width: 12,
//             ),
//             GestureDetector(
//               onTap: () {
//                 buttonState.value = [false, true];
//               },
//               child: tapBarButton(
//                 buttonState.value.last,
//                 'Bio',
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return Scaffold(
//         body: SafeArea(
//       child: userProfile.when(
//         data: (user) {
//           return NestedScrollView(
//             // floatHeaderSlivers: true,
//             headerSliverBuilder: (context, innerBoxIsScrolled) {
//               return [
//                 SpecificUserProfileDetails(
//                   bottom: bottom(),
//                   heroTag: heroTag,
//                 )
//               ];
//             },
//             body: buttonState.value.first
//                 ? const ArticleByAuthorList()
//                 : bio(userProfile.value!.bio),
//           );
//         },
//         loading: () {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//         error: (context, error) {
//           return Center(
//             child: Text(error.toString()),
//           );
//         },
//       ),
//     ));
//   }

//   Widget bio(String bio) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 14, right: 14, top: 20),
//       child: Text(
//         bio,
//         style: const TextStyle(fontSize: 12),
//       ),
//     );
//   }
// }
