import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ulab_blood_bank/res/dimens/common_sizing.dart';
import 'package:ulab_blood_bank/ui/layouts/welcome_screens/welcome_screen2.dart';

import '../../../res/colors/app_colors.dart';

class WelcomeScreen1 extends ConsumerStatefulWidget {
  const WelcomeScreen1({super.key});

  @override
  ConsumerState<WelcomeScreen1> createState() => _WelcomeScreen1State();
}

class _WelcomeScreen1State extends ConsumerState<WelcomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/ic_img_wsone.svg",
            height: 227,
            width: 319,
          ),
          verticalGap36,
          const Text(
            "DONATE BLOOD",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 32, color: Colors.black),
          ),
          verticalGap16,
          const Text(
            "Give blood to help the world. Every drop of blood help save atleast one life.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          verticalGap36,
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const WelcomeScreen2();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(107, 58),
                backgroundColor: AppColors.primaryPalette,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            child: const Text(
              "NEXT",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
