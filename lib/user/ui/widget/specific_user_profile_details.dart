// import 'package:btax/user/controller/specific_user_controller_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class SpecificUserProfileDetails extends HookConsumerWidget {
//   final Widget bottom;
//   final String heroTag;
//   const SpecificUserProfileDetails(
//       {Key? key, required this.bottom, required this.heroTag})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context, ref) {
//     final userProfile = ref.watch(specificUserControllerProvider);
//     return SliverAppBar(
//         expandedHeight: 180.0,
//         pinned: true,
//         floating: true,
//         centerTitle: false,
//         automaticallyImplyLeading: false,
//         stretch: true,
//         elevation: 2,
//         leading: IconButton(
//           icon: const Icon(
//             CupertinoIcons.arrow_left,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.more_vert,
//               color: Colors.black,
//             ),
//             onPressed: () {},
//           )
//         ],
//         backgroundColor: Colors.white,
//         bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(40), child: bottom),
//         flexibleSpace: FlexibleSpaceBar(
//             stretchModes: const <StretchMode>[StretchMode.blurBackground],
//             centerTitle: true,
//             background: Container(
//               //  height: 20,
//               decoration: BoxDecoration(
//                 border: Border(
//                     top: BorderSide(color: Colors.grey.shade200),
//                     bottom: BorderSide(color: Colors.grey.shade200)),
//               ),
//               child: userProfile.when(
//                 data: (user) => Padding(
//                   padding: const EdgeInsets.only(top: 0, left: 14, right: 14),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
// //Profile Image ----------------------------------------------------------
//                           profileImage(
//                               user.profileUrl, user.userName, 24, heroTag),
//                           const SizedBox(
//                             width: 8,
//                           ),
//                           SizedBox(
//                             height: 40,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
// //User Name --------------------------------------------------------------
//                                 Text(
//                                   user.userName,
//                                   style: TextStyle(
//                                       color: textColor,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 Row(children: [
// // Follower Count --------------------------------------------------------
//                                   Text(
//                                     user.followers.length.toString() +
//                                         ' followers',
//                                     style: const TextStyle(
//                                         // fontWeight: FontWeight.w500,
//                                         fontSize: 14),
//                                   ),

//                                   const Text('   -  '),
// // Following Count -------------------------------------------------------
//                                   Text(
//                                     user.following.length.toString() +
//                                         ' following',
//                                     style: const TextStyle(
//                                         // fontWeight: FontWeight.w500,
//                                         fontSize: 14),
//                                   )
//                                   //
//                                 ]),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(right: 8.0),
//                         child: SpecificUserFollowButton(),
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       )
//                     ],
//                   ),
//                 ),
//                 loading: () => const Center(
//                   child: CircularProgressIndicator(),
//                 ),
//                 error: (e, _) => Center(
//                   child: Text(e.toString()),
//                 ),
//               ),
//             )));
//   }

//   Widget title() {
//     return Text(
//       '  user.userName',
//       style: TextStyle(
//           color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
//     );
//   }

//   Widget followers() {
//     return Row(
//       children: [
//         Text(
//           'user.followers.length.toString()' + 'followers',
//           style: TextStyle(
//               // fontWeight: FontWeight.w500,
//               fontSize: 14),
//         ),
//         const SizedBox(
//           width: 8,
//         ),
//         Icon(
//           Icons.favorite_border,
//           color: Colors.grey.shade600,
//           size: 16,
//         ),
//       ],
//     );
//   }

//   Widget following() {
//     return Text(
//       ' user.following.toString()' + ' following',
//       style: const TextStyle(
//           // fontWeight: FontWeight.w500,
//           fontSize: 14),
//     );
//   }
// }
