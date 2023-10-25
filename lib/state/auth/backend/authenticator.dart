import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ljrrt/state/auth/constants/constants.dart';
import 'package:ljrrt/state/auth/models/auth_result.dart';
import 'package:ljrrt/state/post/typedefs/user_id.dart';

class Authenticator {
  // create getters from firebase auth
  UserId? get userID => FirebaseAuth.instance.currentUser?.uid;

  bool get isAlreadyLoggedIn => userID != null;

  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';

  String? get email => FirebaseAuth.instance.currentUser?.email;

  //logout user from all providers
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  Future<AuthResult> logInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      Constants.emailScope,
    ]);

    //display google sign in dialog
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResult.aborted;
    }
    final googleAuth = await signInAccount.authentication;

    //get credentials from google
    final authCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // give credentials to firebase auth
    try {
      await FirebaseAuth.instance.signInWithCredential(authCredential);
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }
}
