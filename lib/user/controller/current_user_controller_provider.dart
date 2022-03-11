import 'package:btax/user/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../authencation/controller/auth_controller.dart';
import '../model/user_model.dart';

final currentUserControllerProvider =
    StateNotifierProvider<CurrentUserController, AsyncValue<UserModel>>((ref) {
  return CurrentUserController(ref.read)
    ..getUser(ref.watch(authStateControllerProvider).value!.uid);
});

class CurrentUserController extends StateNotifier<AsyncValue<UserModel>> {
  final Reader _read;
  // List<UserModel> userModel = [];
  CurrentUserController(this._read) : super(const AsyncValue.loading());
  getUser(String userId) async {
    state = const AsyncLoading();
    try {
      final getUser = await _read(userRepositoryProvider).getUser(userId);

      if (mounted) {
        state = AsyncValue.data(getUser);
      }
    } catch (e) {
      print(e);
    }
  }

  uploadUserProfile() {}

  // async {
  // //  state = const AsyncLoading();
  // try {
  //   final getUser = await _read(specificUserRepositoryProvider)
  //       .followUser(_read(authStateControllerProvider).value!.uid);
  //   print(getUser);
  //   if (mounted) {
  //     state = AsyncValue.data(getUser!);
  //   }
  // } catch (e) {
  //   print(e);
  // }
  //}
}
