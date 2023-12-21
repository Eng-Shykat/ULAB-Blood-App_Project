import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/common/dropdown_items.dart';
import 'package:ulab_blood_bank/data/model/post_data_model.dart';
import 'package:ulab_blood_bank/data/model/single_blood_card.dart';
import 'package:ulab_blood_bank/provider/global_provider.dart';
import 'package:ulab_blood_bank/res/dimens/common_sizing.dart';

import '../../../res/colors/app_colors.dart';

class NewPostScreen extends ConsumerStatefulWidget {
  const NewPostScreen({super.key});

  @override
  ConsumerState<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends ConsumerState<NewPostScreen> {
  final _bloodGroupList = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
  ];

  final _amountOfBloodController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  void dispose() {
    _amountOfBloodController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Choose Blood Group",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _bloodGroupList.length,
                  itemBuilder: (context, index) {
                    // return ListTile(
                    //   title: Text(_bloodGroupList[index]),
                    //   onTap: () {
                    //     Navigator.pop(context, _bloodGroupList[index]);
                    //   },
                    // );
                    return SingleBloodCard(
                        bloodGroup: _bloodGroupList[index], index: index);
                  },
                ),
              ),
              const Text(
                "Amount of Blood",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              verticalGap8,
              TextField(
                controller: _amountOfBloodController,
                decoration: getInputDecoration("Amount of Blood"),
              ),
              verticalGap16,
              const Text(
                "Priority",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              verticalGap8,
              DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: AppColors.inputBG,
                ),
                child: DropdownButton<String>(
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'RobotoSlab',
                  ),
                  underline: const SizedBox(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  isExpanded: true,
                  value: ref.watch(urgencyTypeProvider),
                  onChanged: (String? value) {
                    ref.read(urgencyTypeProvider.notifier).state = value!;
                  },
                  items:
                      urgencyType.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              verticalGap16,
              const Text(
                "Location",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              verticalGap8,
              TextField(
                controller: _locationController,
                decoration: getInputDecoration("Location"),
              ),
              verticalGap32,
              Center(
                child: SizedBox(
                  width: 235,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPalette,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      final auth = FirebaseAuth.instance;
                      final user = auth.currentUser;
                      final uid = user!.uid;
                      final userRef = await FirebaseFirestore.instance
                          .collection("users")
                          .where('id', isEqualTo: uid)
                          .get();
                      final userName = userRef.docs[0].data()["name"];

                      if (_amountOfBloodController.text
                              .toString()
                              .trim()
                              .isEmpty ||
                          _locationController.text.toString().trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all the fields"),
                          ),
                        );
                      } else {
                        final postRef = FirebaseFirestore.instance
                            .collection("posts")
                            .doc();

                        final postDataModel = PostDataModel(
                          id: postRef.id,
                          bloodGroup:
                              _bloodGroupList[ref.read(selectedBloodProvider)],
                          amountOfBlood: _amountOfBloodController.text,
                          urgency: ref.read(urgencyTypeProvider),
                          location: _locationController.text,
                          userName: userName,
                          userId: uid,
                          createdAt:
                              DateTime.now().microsecondsSinceEpoch.toString(),
                        );
                        await postRef.set(postDataModel.toJson());

                        _locationController.clear();
                        _amountOfBloodController.clear();
                        ref.read(urgencyTypeProvider.notifier).state =
                            urgencyType[0];
                      }
                    },
                    child: const Text(
                      "POST",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'RobotoSlab',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String? hintText) {
    return InputDecoration(
      hintText: hintText ?? "",
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      disabledBorder: InputBorder.none,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      fillColor: AppColors.inputBG,
      filled: true,
    );
  }
}
