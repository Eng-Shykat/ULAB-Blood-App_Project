import 'package:flutter/material.dart';
import 'package:ulab_blood_bank/res/colors/app_colors.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key, required this.onItemTapped});

  final Function(int) onItemTapped;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemTapped(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.primaryBlack1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                _onItemTapped(0);
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Icon(
                  Icons.home_filled,
                  color: _selectedIndex == 0
                      ? AppColors.primaryPalette
                      : Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _onItemTapped(1);
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Icon(
                  Icons.assistant_navigation,
                  color: _selectedIndex == 1
                      ? AppColors.primaryPalette
                      : Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _onItemTapped(2);
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: _selectedIndex == 2
                      ? AppColors.primaryPalette
                      : AppColors.colorSecondaryBlack,
                  child: Icon(
                    Icons.water_drop,
                    color: _selectedIndex == 2
                        ? Colors.white
                        : AppColors.primaryPalette,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _onItemTapped(3);
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Icon(
                  Icons.notifications_rounded,
                  color: _selectedIndex == 3
                      ? AppColors.primaryPalette
                      : Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _onItemTapped(4);
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Icon(
                  Icons.person_2_outlined,
                  color: _selectedIndex == 4
                      ? AppColors.primaryPalette
                      : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
