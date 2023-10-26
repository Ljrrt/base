import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ljrrt/state/auth/models/auth_state.dart';
import 'package:ljrrt/state/auth/notifier/auth_state_notifier.dart';

// authStateProvider is like a singleton as is created only once, so we only create
// on instance of AuthStateNotifier

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (_) => AuthStateNotifier(),
);
