import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';

import '../models/UserModel.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  UserAttributes? _firebaseUser(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserAttributes(user.uid, user.email);
  }

  Stream<UserAttributes?>? get user {
    return _firebaseAuth.authStateChanges().map(_firebaseUser);
  }

  Future<UserAttributes?> signInWithEmailAndPassword(
    String email ,
    String password,
  ) async {
    final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email:email, password: password);
    return _firebaseUser(credentials.user);
  }

  Future<UserAttributes?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return _firebaseUser(credential.user);

  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
