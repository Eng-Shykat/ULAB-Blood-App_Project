import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ulab_blood_bank/data/model/notification_data_model.dart';

class SingleNotification extends StatelessWidget {
  const SingleNotification({
    super.key, required this.notificationDataModel,
  });

  final NotificationDataModel notificationDataModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            height: 80,
            width: 80,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                "https://www.pngitem.com/pimgs/m/294-2947257_interface-icons-user-avatar-profile-user-avatar-png.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 16, 0),
            child: Text(
              notificationDataModel.userName,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
