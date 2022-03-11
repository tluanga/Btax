import 'package:btax/user/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/user_model.dart';

final userControllerProvider =
    StateNotifierProvider<UserController, AsyncValue<List<UserModel>>>((ref) {
  return UserController(ref.read)..getUser();
});

class UserController extends StateNotifier<AsyncValue<List<UserModel>>> {
  final Reader _read;
  List<UserModel> userModel = [];
  UserController(this._read) : super(const AsyncValue.loading());
  getUser() async {
    state = const AsyncLoading();
    try {
      final getUser = await _read(userRepositoryProvider).getUser(10);
      if (mounted) {
        state = getUser.isEmpty
            ? const AsyncError('No category found')
            : AsyncValue.data(getUser);
      }
    } catch (e) {
      print(e);
    }
    // Provider.autoDispose(
    //   (_) async {
    //     articles = await ArticleModel.getArticleByCategory(category);
    //     state = articles.isEmpty ? const AsyncError(message: 'No article found') : AsyncSuccess(data: articles);
    //   },
    // );
  }

  uploadUserProfile(UserModel userModel) async {
    try {
      await _read(userRepositoryProvider).uploadUserProfile(userModel);
    } catch (e) {
      print(e);
    }
    // Provider.autoDispose(
    //   (_) async {
    //     articles = await ArticleModel.getArticleByCategory(category);
    //     state = articles.isEmpty ? const AsyncError(message: 'No article found') : AsyncSuccess(data: articles);
    //   },
    // );
  }
}
