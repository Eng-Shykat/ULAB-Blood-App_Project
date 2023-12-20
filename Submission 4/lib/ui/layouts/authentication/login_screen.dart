import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/repository/auth_repository.dart';
import 'package:ulab_blood_bank/ui/layouts/authentication/register_screen.dart';
import 'package:ulab_blood_bank/ui/layouts/home_screen/home_screen.dart';

import '../../../res/colors/app_colors.dart';
import '../../../res/dimens/common_sizing.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  var emailTextController = TextEditingController();
  var passWordTextController = TextEditingController();

  final _authRepo = AuthRepository();

  @override
  void dispose() {
    emailTextController.dispose();
    passWordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryBlack1,
        title: const Text(
          "Sign In",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: getLabelStyle(),
            ),
            verticalGap8,
            TextField(
              controller: emailTextController,
              decoration: const InputDecoration(
                hintText: "Email",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                disabledBorder: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                fillColor: AppColors.inputBG,
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            verticalGap16,
            Text(
              "Password",
              style: getLabelStyle(),
            ),
            verticalGap8,
            TextField(
              controller: passWordTextController,
              decoration: const InputDecoration(
                hintText: "Enter Password",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                disabledBorder: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                fillColor: AppColors.inputBG,
                filled: true,
              ),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            verticalGap16,
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                onPressed: loginUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPalette[600],
                  minimumSize: const Size(150, 58.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    "LOG In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            verticalGap16,
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  minimumSize: const Size(150, 58.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    var userEmail = emailTextController.text.toString().trim();
    var userPassword = passWordTextController.text.toString().trim();

    if (userEmail.isEmpty || userPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All fields are required"),
        ),
      );
    } else {
      await _authRepo.login(userEmail, userPassword, context);
    }

    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  TextStyle getLabelStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Colors.black,
    );
  }
}
