import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/data/model/user_data_model.dart';

final profileProvider = StateNotifierProvider.autoDispose<UserInfoNotifier,
    AsyncValue<UserDataModel?>>(
  (ref) {
    return UserInfoNotifier();
  },
);

class UserInfoNotifier extends StateNotifier<AsyncValue<UserDataModel?>> {
  UserDataModel? _userInfo;

  UserInfoNotifier() : super(const AsyncValue.loading()) {
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    state = const AsyncValue.loading();
    try {
      _userInfo = await _getUserInfo();
      state = AsyncValue.data(_userInfo);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<UserDataModel> _getUserInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    return UserDataModel.fromJson(userData.data()!);
  }
}
