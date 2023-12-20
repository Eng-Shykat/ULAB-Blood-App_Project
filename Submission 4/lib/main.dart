import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/ui/layouts/authentication/login_screen.dart';
import 'package:ulab_blood_bank/ui/layouts/home_screen/home_screen.dart';
import 'package:ulab_blood_bank/ui/layouts/welcome_screens/welcome_screen1.dart';
import 'package:ulab_blood_bank/ui/layouts/welcome_screens/welcome_screen2.dart';
import 'package:ulab_blood_bank/ui/layouts/welcome_screens/welcome_screen3.dart';

import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: ULABBloodBank()));
}

class ULABBloodBank extends StatelessWidget {
  const ULABBloodBank({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ULAB Blood Bank',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const _RootView(),
    );
  }
}

class _RootView extends StatefulWidget {
  const _RootView({super.key});

  @override
  State<_RootView> createState() => _RootViewState();
}

class _RootViewState extends State<_RootView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
