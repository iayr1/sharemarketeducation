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
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
              bottom: 100.0,
              left: 10.0,
              right: 50.0,
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
