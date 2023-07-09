import 'package:firebase_auth/firebase_auth.dart';

Future<void> createUserWithEmailPassword(ema, passwd) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: ema,
      password: passwd,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> signInUserWithEmailPassword(ema, passwd) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: ema,
      password: passwd,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
