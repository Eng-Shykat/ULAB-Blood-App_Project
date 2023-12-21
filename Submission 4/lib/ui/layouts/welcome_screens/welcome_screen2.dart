import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ulab_blood_bank/ui/layouts/welcome_screens/welcome_screen1.dart';

import '../../../res/colors/app_colors.dart';
import '../../../res/dimens/common_sizing.dart';

class WelcomeScreen2 extends ConsumerStatefulWidget {
  const WelcomeScreen2({super.key});

  @override
  ConsumerState<WelcomeScreen2> createState() => _WelcomeScreen2State();
}

class _WelcomeScreen2State extends ConsumerState<WelcomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/ic_img_wstwo.svg",
            height: 227,
            width: 319,
          ),
          verticalGap36,
          const Text(
            "WHEN TO GIVE",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 32, color: Colors.black),
          ),
          verticalGap16,
          const Text(
            "A whole blood donor can give blood up to six times a year.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          verticalGap36,
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(107, 58),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "PREVIOUS",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const WelcomeScreen1();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(107, 58),
                  backgroundColor: AppColors.primaryPalette,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "NEXT",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
