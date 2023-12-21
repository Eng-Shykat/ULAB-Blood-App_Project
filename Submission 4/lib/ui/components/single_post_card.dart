import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ulab_blood_bank/res/dimens/common_sizing.dart';

import '../../res/colors/app_colors.dart';

class SinglePostCard extends StatelessWidget {
  const SinglePostCard(
      {super.key,
      // required this.imageUrl,
      required this.bloodGroup,
      required this.postType,
      required this.userName,
      required this.location});

  // final String imageUrl;
  final String bloodGroup;
  final String postType;
  final String userName;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(
                    "https://www.pngitem.com/pimgs/m/294-2947257_interface-icons-user-avatar-profile-user-avatar-png.png",
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              horizontalGap12,
              SizedBox(
                width: 84,
                height: 26,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: postType == 'Urgent'
                        ? AppColors.primaryPalette
                        : AppColors.colorSecondaryBlack,
                  ),
                  child: Text(
                    postType,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: 80,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryPalette,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      bloodGroup,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              userName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryPalette,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              "Location: $location",
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
