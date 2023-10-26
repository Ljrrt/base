import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ljrrt/state/auth/backend/authenticator.dart';
import 'package:ljrrt/state/auth/models/auth_result.dart';
import 'package:ljrrt/state/auth/models/auth_state.dart';
import 'package:ljrrt/state/post/typedefs/user_id.dart';
import 'package:ljrrt/state/user_info/backend/user_info_storage.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();
  final _userInfoStorage = const UserInfoStorage();

  // first we start at unknown state, and if state object is changed, whoever is listening will be notified
  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        result: AuthResult.success,
        isLoading: false,
        userId: _authenticator.userId,
      );
    }
  }

  Future<void> logOut() async {
    //set loading state until log out
    state = state.copiedWithIsLoading(true);
    // log out
    await _authenticator.logOut();
    //set state to unknown(logged out)
    state = const AuthState.unknown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.logInWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(
        userId: userId,
      );
    }
    state = AuthState(result: result, isLoading: false, userId: userId);
  }

  Future<void> saveUserInfo({required UserId userId}) =>
      _userInfoStorage.saveUserInfo(
          userId: userId,
          displayName: _authenticator.displayName,
          email: _authenticator.email);
}
