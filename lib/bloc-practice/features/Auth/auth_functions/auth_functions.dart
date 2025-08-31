import 'package:firebase_auth/firebase_auth.dart';
 
Future<UserCredential?> signup(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await credential.user?.sendEmailVerification();
    print('Successfully created user and sent email verification');
    return credential;
  } catch (error) {
    print('Error during sign up: $error');
    return null;
  }
}

Future<UserCredential?> signin(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('Successfully signed in');
    return credential;
  } catch (error) {
    print('Error during sign in: $error');
    return null;
  }
}
