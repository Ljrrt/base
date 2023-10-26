import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ljrrt/state/auth/providers/auth_state_provider.dart';
import 'package:ljrrt/state/post/typedefs/user_id.dart';

final userIdProvider = Provider<UserId?>(
  (ref) => ref.watch(authStateProvider).userId,
);
