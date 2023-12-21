import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/colors/app_colors.dart';
import '../../../res/dimens/common_sizing.dart';

class WelcomeScreen3 extends ConsumerStatefulWidget {
  const WelcomeScreen3({super.key});

  @override
  ConsumerState<WelcomeScreen3> createState() => _WelcomeScreen3State();
}

class _WelcomeScreen3State extends ConsumerState<WelcomeScreen3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/ic_img_wsthree.svg",
            height: 227,
            width: 319,
          ),
          verticalGap36,
          const Text(
            "FAST FINDING",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 32, color: Colors.black),
          ),
          verticalGap16,
          const Text(
            "We find the nearest patient for blood donation in your area.",
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
                onPressed: () {},
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