import 'dart:async';
import 'package:flutter/material.dart';
import 'package:edtech_app/core/utils/navigation_service.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(Navigation.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.black87,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Align(
          alignment: Alignment.center, // Center the child
          child: Padding(
            padding: const EdgeInsets.only(
              top: 100.0, // Adjust top padding
              bottom: 100.0, // Adjust bottom padding
              left: 10.0, // Adjust left padding
              right: 50.0, // Adjust right padding
            ),
            child: SizedBox(
              height: 400,
              width: 400,
              child: Lottie.asset('assets/applottie.json'),
            ),
          ),
        ),
      ),
    );
  }
}
