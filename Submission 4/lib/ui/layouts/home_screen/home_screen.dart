import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ulab_blood_bank/res/colors/app_colors.dart';
import 'package:ulab_blood_bank/res/dimens/common_sizing.dart';
import 'package:ulab_blood_bank/ui/components/custom_navbar.dart';
import 'package:ulab_blood_bank/ui/components/progress_bar.dart';
import 'package:ulab_blood_bank/ui/layouts/home_screen/home_fragment.dart';
import 'package:ulab_blood_bank/ui/layouts/new_post_screen/new_post_screen.dart';
import 'package:ulab_blood_bank/ui/layouts/notification_screen/notification_screen.dart';
import 'package:ulab_blood_bank/ui/layouts/posts_screen/posts_screen.dart';
import 'package:ulab_blood_bank/ui/layouts/profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance
        .subscribeToTopic(FirebaseAuth.instance.currentUser!.uid);

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 10,
      //   backgroundColor: AppColors.primaryBlack1,
      //   title: const Text(
      //     "ULAB BLOOD BANK",
      //     style: TextStyle(
      //       fontWeight: FontWeight.w800,
      //       fontFamily: 'RobotoSlab',
      //     ),
      //   ),
      // ),
      body: PageView(
        controller: _pageController,
        physics:
            const NeverScrollableScrollPhysics(), // Disable swipe navigation
        children: [
          HomeFragment(),
          PostsScreen(),
          NewPostScreen(),
          NotificationScreen(),
          ProfileScreen()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.message_rounded,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primaryBlack1,
      ),
      bottomNavigationBar: CustomNavigationBar(
        onItemTapped: _onNavBarItemTapped,
      ),
    );
  }
}
