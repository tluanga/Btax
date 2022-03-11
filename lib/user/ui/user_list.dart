// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:inleng/home/category_button_list/ui/sub_widget/categoty_list_text_button.dart';
// import 'package:inleng/user/controller/user_controller_provider.dart';
// import 'package:inleng/user/model/user_model.dart';

// class UserButtonList extends HookConsumerWidget {
//   const UserButtonList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final categoryList = ref.watch(userControllerProvider);
//     return Material(
//       elevation: 0,
//       color: Colors.white,
//       child: SizedBox(
//         height: 50,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(left: 16.0),
//               child: Text('User :'),
//             ),
//             const SizedBox(
//               width: 8,
//             ),
//             SizedBox(
//               height: 35,
//               child: categoryList.when(
//                 data: (list) => userListView(context, list),
//                 loading: () => CircularProgressIndicator(),
//                 error: (e, s) => Text('error'),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget userListView(BuildContext context, List<UserModel> user) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.81,
//       height: 35,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           primary: true,
//           shrinkWrap: true,
//           itemCount: user.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {},
//               child: Padding(
//                   padding: const EdgeInsets.only(left: 4, right: 6),
//                   child: categoryListTextButton(
//                       context, user[index].name, Colors.black)),
//             );
//           }),
//     );
//   }
// }
