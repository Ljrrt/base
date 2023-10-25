import 'package:flutter/foundation.dart';
import 'package:ljrrt/state/post/typedefs/user_id.dart';

import 'auth_result.dart';

@immutable
class AuthState {
  final AuthResult? result;
  final bool isLoading;
  final UserId? userId;

  AuthState({
    required this.result,
    required this.isLoading,
    required this.userId,
  });

  const AuthState.unknown()
      : result = null,
        isLoading = false,
        userId = null;

  // creates a copy of this instance but with the given fields replaced with the is loading value
  AuthState copiedWithIsLoading(bool isLoading) => AuthState(
        result: result,
        isLoading: isLoading,
        userId: userId,
      );

  // override == operator to compare AuthState objects
  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId);

  @override
  int get hashCode => Object.hash(
        result,
        isLoading,
        userId,
      );
}
