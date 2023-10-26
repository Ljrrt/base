import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:ljrrt/state/constants/firebase_field_name.dart';
import 'package:ljrrt/state/post/typedefs/user_id.dart';

// serialize values into map view, so instances of UserInfoPayload can be stored directly in firestore

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displayName: displayName ?? '',
          FirebaseFieldName.email: email ?? '',
        });
}
