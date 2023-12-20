import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/repository/auth_repository.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final storageProvider = Provider((ref) => FirebaseStorage.instance);

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

final firebaseStorageProvider = Provider((ref) => FirebaseStorage.instance);
