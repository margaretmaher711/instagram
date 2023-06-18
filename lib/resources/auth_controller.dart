import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String userName,
    required String email,
    required String password,
    required String bio,
    // required Uint8List file,
  }) async {
    String res = 'some error';
    try {
      if (userName.isNotEmpty ||
              email.isNotEmpty ||
              password.isNotEmpty ||
              password.isNotEmpty ||
              bio.isNotEmpty
          // || file != null
          ) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserModel user = UserModel(
            userName: userName,
            uid: cred.user!.uid,
            email: email,
            bio: bio,
            following: [],
            followers: [],
            password: password);
        _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
        res = 'success';
        print('cred$cred');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        res = 'This email is already in use';
      } else if (e.code == 'weak-password') {
        res = 'Password should be at least 6 characters';
      } else if (e.code == 'invalid-email') {
        res = 'The email address is badly formatted.';
      }

      print(e.code);
      // res = e.toString();
    }
    return res;
  }
}
