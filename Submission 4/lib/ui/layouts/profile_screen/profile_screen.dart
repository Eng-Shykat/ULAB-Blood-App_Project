import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/data/model/user_data_model.dart';
import 'package:ulab_blood_bank/repository/ProfileRepository.dart';
import 'package:ulab_blood_bank/res/dimens/common_sizing.dart';

import '../../../data/model/profile_data_model.dart';
import '../../../repository/auth_repository.dart';
import '../../../res/colors/app_colors.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({super.key});

  final _authRepo = AuthRepository();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataModelProvider = ref.watch(profileProvider);

    Widget buildBody(UserDataModel? userDataModel) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    "PROFILE",
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
              SizedBox(
                width: 170,
                height: 170,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(
                    "https://www.pngitem.com/pimgs/m/294-2947257_interface-icons-user-avatar-profile-user-avatar-png.png",
                  ),
                ),
              ),
              verticalGap16,
              Text(
                userDataModel!.name, //profileDataModel.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalGap24,
              // ElevatedButton(
              //   onPressed: () {},
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: AppColors.primaryPalette,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //   ),
              //   child: const Text(
              //     "Want to Donate",
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              verticalGap16,
              const Text(
                "Donate blood, save lives.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              verticalGap8,
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                height: 100,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Text(
              //         "Next Donation Date: ",
              //         style: getTextStyle(),
              //       ),
              //     ),
              //     Expanded(
              //       child: Text(
              //         userDataModel.nextDonationDate,
              //         style: getTextStyle(),
              //       ),
              //     ),
              //   ],
              // ),
              verticalGap16,
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Blood Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'RobotoSlab',
                      ),
                    ),
                  ),
                ],
              ),
              verticalGap8,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Blood Group: ",
                      style: getTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      userDataModel.bloodGroup,
                      style: getTextStyle(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Disease: ",
                      style: getTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      userDataModel.hasAnyBloodDiseaseBefore == true
                          ? "Yes"
                          : "No",
                      style: getTextStyle(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Last Donation Date: ",
                      style: getTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      userDataModel.lastDonatedDate ?? "None",
                      style: getTextStyle(),
                    ),
                  ),
                ],
              ),
              verticalGap16,
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Personal Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'RobotoSlab',
                      ),
                    ),
                  ),
                ],
              ),
              verticalGap8,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Date Of Birth: ",
                      style: getTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      userDataModel.dateOfBirth,
                      style: getTextStyle(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Gender: ",
                      style: getTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      userDataModel.gender,
                      style: getTextStyle(),
                    ),
                  ),
                ],
              ),
              verticalGap16,
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Contact Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'RobotoSlab',
                      ),
                    ),
                  ),
                ],
              ),
              verticalGap8,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Contact Number: ",
                      style: getTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      userDataModel.phone,
                      style: getTextStyle(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Email: ",
                      style: getTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      userDataModel.email,
                      style: getTextStyle(),
                    ),
                  ),
                ],
              ),
              verticalGap36,
              ElevatedButton(
                onPressed: () {
                  _authRepo.signout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPalette,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  "LOG OUT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
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

    return userDataModelProvider.when(
      data: buildBody,
      loading: buildLoading,
      error: buildError,
    );
  }

  TextStyle getTextStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: 'RobotoSlab',
    );
  }
}
