
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{

  Stream<User?> handleAuthState() {
   return FirebaseAuth.instance.idTokenChanges();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    //Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]
    ).signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    FirebaseAuth.instance.signOut();
    await _googleSignIn.disconnect();
  }
}