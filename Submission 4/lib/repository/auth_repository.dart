import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulab_blood_bank/data/model/user_data_model.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;
  final _firebaseDatabase = FirebaseFirestore.instance;
  User? get currentUser => _auth.currentUser;

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e, s) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
    }
  }

  Future<void> register(UserDataModel userDataModel, String password,
      BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userDataModel.email, password: password);
      await _storeInDB(userDataModel);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Your account details have been saved."),
        ),
      );
    } on FirebaseAuthException catch (e, s) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
    }
  }

  Future<void> signout() async {
    await _auth.signOut();
  }

  Future<void> _storeInDB(UserDataModel usersDataModel) async {
    usersDataModel.id = currentUser?.uid;
    _firebaseDatabase
        .collection("users")
        .doc(currentUser?.uid)
        .set(usersDataModel.toJson());
  }
}
