import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../repository/ProfileRepository.dart';
import '../../../res/colors/app_colors.dart';
import '../../../res/dimens/common_sizing.dart';
import '../../components/progress_bar.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    final userDataModel = ref.watch(profileProvider);
    final userData = userDataModel.when(
      data: (data) => data,
      loading: () => null,
      error: (error, stackTrace) => null,
    );

    if (userData?.lastDonatedDate != null) {
      final date2 = DateTime.now();
      final difference =
          date2.difference(DateTime.parse(userData!.lastDonatedDate!)).inDays;
    }

    return SingleChildScrollView(
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
                "HOME",
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
          Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 80),
            child: SizedBox(
              height: 100,
              child: Center(
                child: ProgressBar(
                  dateCount: DateTime.now()
                      .difference(DateTime.parse(userData!.lastDonatedDate!))
                      .inDays,
                  progress: .75,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 235,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlack1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "PATIENTS SAVED  06",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'RobotoSlab',
                ),
              ),
            ),
          ),
          verticalGap16,
          SizedBox(
            width: 235,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPalette,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "HOSPITAL",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'RobotoSlab',
                ),
              ),
            ),
          ),
          verticalGap16,
          const SizedBox(
            width: 33,
            child: Divider(
              color: AppColors.primaryBlack1,
              thickness: 2,
            ),
          ),
          verticalGap36,
          GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 10,
              color: AppColors.colorSecondaryBlack,
              child: SizedBox(
                width: 320,
                height: 150,
                child: Row(
                  children: [
                    horizontalGap16,
                    SvgPicture.asset(
                      "assets/ic_illus_nurse.svg",
                    ),
                  ],
                ),
              ),
            ),
          ),
          verticalGap16,
          GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 10,
              color: AppColors.primaryPalette,
              child: SizedBox(
                width: 320,
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/ic_illus_docs.svg",
                    ),
                    const Text(
                      "FAQ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'RobotoSlab',
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
