import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/data/model/post_data_model.dart';

import '../provider/global_provider.dart';

final postsRepositoryProvider =
    StreamProvider<QuerySnapshot<PostDataModel>>((ref) {
  return ref
      .read(firestoreProvider)
      .collection('posts')
      .orderBy("createdAt", descending: true)
      .withConverter<PostDataModel>(
          fromFirestore: (map, options) {
            return PostDataModel.fromJson(map.data()!);
          },
          toFirestore: (model, options) => model.toJson())
      .snapshots();
});
