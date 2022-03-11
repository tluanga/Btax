import 'package:btax/user/authencation/controller/auth_controller.dart';
import 'package:btax/user/model/user_model.dart';
import 'package:btax/user/repository/specific_user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final specificUserControllerProvider =
    StateNotifierProvider<SpecificUserController, AsyncValue<UserModel>>((ref) {
  return SpecificUserController(ref.read)
    ..getUser(ref.watch(selectedAuthorIdcontrollerProvider));
});

class SpecificUserController extends StateNotifier<AsyncValue<UserModel>> {
  final Reader _read;
  // List<UserModel> userModel = [];
  SpecificUserController(this._read) : super(const AsyncValue.loading());
  getUser(String userId) async {
    state = const AsyncLoading();
    try {
      final getUser =
          await _read(specificUserRepositoryProvider).getUser(userId);
      print(getUser!.userName.toString());
      if (mounted) {
        state = AsyncValue.data(getUser);
      }
    } catch (e) {
      print(e);
    }
  }

  followUser() async {
    //  state = const AsyncLoading();
    try {
      final getUser = await _read(specificUserRepositoryProvider)
          .followUser(_read(authStateControllerProvider).value!.uid);
      print(getUser);
      if (mounted) {
        state = AsyncValue.data(getUser!);
      }
    } catch (e) {
      print(e);
    }
  }

  unfollowUser() async {
    // state = const AsyncLoading();
    try {
      final getUser = await _read(specificUserRepositoryProvider)
          .unfollowUser(_read(authStateControllerProvider).value!.uid);
      //  print(getUser!.userName.toString());
      if (mounted) {
        state = AsyncValue.data(getUser!);
      }
    } catch (e) {
      print(e);
    }
  }
}

final selectedAuthorIdcontrollerProvider = StateProvider<String>((ref) {
  return '';
});
