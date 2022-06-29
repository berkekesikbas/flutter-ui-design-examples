import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Giriş yapma fonk.
  Future<User?> signIn({required String email, required String password, required BuildContext context}) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return user.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarError(e.message.toString()));
    }
  }

  //Kayıt olma fonk.
  Future<User?> createUser(
      {required String email, required String password, required String name, required BuildContext context}) async {
    try {
      var user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection("Kullanıcılar").doc(user.user!.uid).set({
        'userID': user.user!.uid,
        'isimSoyisim': name,
        'email': email,
      });
      return user.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarError(e.message.toString()));
    }
  }
}

SnackBar snackBarError(String error) {
  return SnackBar(
    content: Text(error),
    action: SnackBarAction(
      label: 'Tamam',
      onPressed: () {},
    ),
  );
}
