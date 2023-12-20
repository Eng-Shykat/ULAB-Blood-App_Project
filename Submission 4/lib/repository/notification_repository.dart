import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/notification_data_model.dart';
import '../provider/global_provider.dart';

final notificationRepositoryProvider =
StreamProvider<QuerySnapshot<NotificationDataModel>>((ref) {
  return ref
      .read(firestoreProvider)
      .collection('notifications')
      .orderBy("createdAt", descending: true)
      .withConverter<NotificationDataModel>(
      fromFirestore: (map, options) {
        return NotificationDataModel.fromMap(map.data()!);
      },
      toFirestore: (model, options) => model.toMap())
      .snapshots();
});
