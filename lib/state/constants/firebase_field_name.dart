import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName {
  // fields in firebase
  static const userId = 'uid';
  static const postId = 'post_id';
  static const comment = 'comment';
  static const createdAt = 'created_at';
  static const date = 'date';
  static const displayName = 'display_name';
  static const email = 'email';

  // constant class constructor
  const FirebaseFieldName._();
}