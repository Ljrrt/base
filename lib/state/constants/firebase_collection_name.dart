import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseCollectionName {
  // collections in firebase
  static const thumbnails = 'thumbnails';
  static const comments = 'comments';
  static const likes = 'likes';
  static const posts = 'posts';
  static const users = 'users';

  // constant class constructor
  const FirebaseCollectionName._();
}
