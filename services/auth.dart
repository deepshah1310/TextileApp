import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/app/services/platform_exception_alert_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {

  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<User> signInWithGoogle();
 // Stream<User> get onAuthStateChange;
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  Stream<User> get onAuthStateChanged => _firebaseAuth.authStateChanges();


  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser;
    return user;
  }

  @override
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return authResult.user;
  }
  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccont = await googleSignIn.signIn();
    if (googleAccont != null) {
      final googleAuth = await googleAccont.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _firebaseAuth
            .signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));
        return authResult.user;
      } else {
        throw PlatformExceptionAlertDialog(
            title: "missing google auth token", exception: null);
      }
    } else {
      throw PlatformExceptionAlertDialog(
          title: "error aborted by user", exception: null);
    }
  }
  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return authResult.user;
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult.user;
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
