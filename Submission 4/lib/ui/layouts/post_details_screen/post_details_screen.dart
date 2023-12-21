import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/data/model/notification_data_model.dart';
import 'package:ulab_blood_bank/provider/global_provider.dart';
import 'package:ulab_blood_bank/repository/push_repository.dart';
import 'package:ulab_blood_bank/res/dimens/common_sizing.dart';

import '../../../data/model/post_data_model.dart';
import '../../../res/colors/app_colors.dart';

class PostDetailsScreen extends ConsumerWidget {
  const PostDetailsScreen({super.key, required this.postDataModel});

  final PostDataModel postDataModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PushRepository pushRepository;

    return Scaffold(
      // appBar: AppBar(
      //   leading: SizedBox(
      //     width: 50,
      //     height: 50,
      //     child: DecoratedBox(
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(8),
      //         color: AppColors.colorSecondaryBlack,
      //       ),
      //       child: const Icon(
      //         Icons.arrow_back_rounded,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
              child: Center(
                child: SizedBox(
                  width: 170,
                  height: 170,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      "https://www.pngitem.com/pimgs/m/294-2947257_interface-icons-user-avatar-profile-user-avatar-png.png",
                    ),
                  ),
                ),
              ),
            ),
            Text(
              postDataModel.userName,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                fontFamily: "RobotoSlab",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Blood Group :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "RobotoSlab",
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    postDataModel.bloodGroup,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "RobotoSlab",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Location :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "RobotoSlab",
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    postDataModel.location,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "RobotoSlab",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Priority :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "RobotoSlab",
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    postDataModel.urgency,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "RobotoSlab",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Requires :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "RobotoSlab",
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    postDataModel.amountOfBlood,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "RobotoSlab",
                    ),
                  ),
                ),
              ],
            ),
            verticalGap36,
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  ref.read(firestoreProvider).collection("notifications").add({
                    "userId": postDataModel.userId,
                    "donorId": FirebaseAuth.instance.currentUser!.uid,
                    "userName": postDataModel.userName,
                    "bloodGroup": postDataModel.bloodGroup,
                    "location": postDataModel.location,
                    "urgency": postDataModel.urgency,
                    "amountOfBlood": postDataModel.amountOfBlood,
                    "createdAt": DateTime.now().toString(),
                  });
                  final docRef = ref
                      .read(firestoreProvider)
                      .collection('notification')
                      .doc();
                  final docId = docRef.id;
                  NotificationDataModel notificationDataModel =
                  NotificationDataModel(
                    userId: postDataModel.userId,
                    donorId: FirebaseAuth.instance.currentUser!.uid,
                    userName: postDataModel.userName,
                    bloodGroup: postDataModel.bloodGroup,
                    location: postDataModel.location,
                    urgency: postDataModel.urgency,
                    amountOfBlood: postDataModel.amountOfBlood,
                    createdAt: DateTime.now().toString(),
                    id: docId,
                  );
                  docRef.set(notificationDataModel.toMap());

                  // TODO: Now we need to send a notification to the user using DIO, POST METHOD
                  pushRepository = PushRepository(notificationDataModel);
                  await pushRepository.sendPushNotification();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPalette[600],
                  minimumSize: const Size(150, 58.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    "Donate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: "RobotoSlab",
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
