import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/res/colors/app_colors.dart';

final selectedBloodProvider = StateProvider.autoDispose((ref) => 0);

class SingleBloodCard extends ConsumerWidget {
  const SingleBloodCard(
      {super.key, required this.bloodGroup, required this.index});

  final String bloodGroup;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedBloodProvider.notifier).state = index;
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: 65,
          height: 65,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: ref.watch(selectedBloodProvider) == index
                ? AppColors.primaryPalette
                : Colors.white,
            child: Center(
              child: Text(
                bloodGroup,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ref.watch(selectedBloodProvider) == index
                      ? Colors.white
                      : AppColors.primaryPalette,
                  fontFamily: 'RobotoSlab',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
