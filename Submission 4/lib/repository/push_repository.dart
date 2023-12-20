import 'package:dio/dio.dart';

import '../data/model/notification_data_model.dart';

class PushRepository {
  final NotificationDataModel notificationDataModel;

  PushRepository(this.notificationDataModel);

  Future<void> sendPushNotification() async {
    final dio = Dio();
    await dio.post(
      "https://fcm.googleapis.com/fcm/send",
      data: {
        "to": notificationDataModel.userId,
        "notification": {
          "title": "Blood Request",
          "body": "${notificationDataModel.userName} want to donate blood",
        },
        "data": {
          "title": "Blood Request",
          "body": "${notificationDataModel.userName} want to donate blood",
        },
      },
      options: Options(
        headers: {
          "Authorization":
              "AAAAkMxuM2Q:APA91bGZwsy-pCD8Oid5c6ly2hiFpH1a_jsVkjLW93wG9YEFZC2ZG2gs_y_2iapMDUIQfCpiK4Vw_ndtZQvXiJWNICK6UsPvNIk1XfSHFuBBZdA1TjIMFp3gb6ShnO_rOlGsoVgjQdrA",
          "Content-Type": "application/json"
        },
      ),
    );
  }
}
