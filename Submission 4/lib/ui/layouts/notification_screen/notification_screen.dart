import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/ui/components/single_notification.dart';

import '../../../data/model/notification_data_model.dart';
import '../../../repository/notification_repository.dart';
import '../../../res/dimens/common_sizing.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final notificationRepository = ref.watch(notificationRepositoryProvider);

    Widget buildBody(
        QuerySnapshot<NotificationDataModel> notificationDataModels) {
      List<NotificationDataModel> notifications =
      notificationDataModels.docs.map((e) => e.data()).toList();
      return Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              const Text(
                "NOTIFICATION",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (_, index) {
                return SingleNotification(
                    notificationDataModel: notifications[index]);
              },
            ),
          ),
        ],
      );
    }

    Widget buildLoading() => const Center(
      child: CircularProgressIndicator(),
    );

    Widget buildError(e, s) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Something went wrong'),
            verticalGap8,
            ElevatedButton(
              onPressed: () {},
              child: Text("Retry"),
            ),
          ],
        ),
      );
    }

    return notificationRepository.when(
      data: buildBody,
      error: buildError,
      loading: buildLoading,
    );
  }
}
