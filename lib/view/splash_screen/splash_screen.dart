// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:packages_samples_dec/view/home_screen/home_screen.dart';
import 'package:packages_samples_dec/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      bool isLogged = prefs.getBool("isLogged") ?? false;

      if (isLogged == true) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("splash"),
      ),
    );
  }
}
