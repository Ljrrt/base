import 'package:flutter/foundation.dart';

// class to make the strings constants and easy to change. Also to be able in the future to change the language

@immutable
class Strings {
  //upload post config
  static const allowLikesTitle = 'Allow likes';
  static const allowLikesDescription =
      'By allowing likes, users will be able to like your posts.';
  static const allowLikesStorageKey = 'allow_likes';
  static const allowCommentsTitle = 'Allow comments';
  static const allowCommentsDescription =
      'by allowing comments, users will be able to comment on your posts.';
  static const allowCommentsStorageKey = 'allow_comments';

  //post actions
  static const comment = 'comment';
  static const loading = 'Loading...';
  static const person = 'person';
  static const people = 'people';
  static const likedThis = 'liked this';

  //delete
  static const delete = 'Delete';
  static const areYouSureYouWantToDeleteThis =
      'Are you sure you want to delete this?';

  //log out
  static const logOut = 'Log out';
  static const areYouSureYouWantToLogOut = 'Are you sure you want to log out?';
  static const cancel = 'Cancel';

  const Strings._();
}
