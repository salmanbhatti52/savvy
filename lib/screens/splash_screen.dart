import 'dart:async';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:savvy/screens/landing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.popAndPushNamed(context, LandingPage.screenName));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
              height: size.height * 0.8,
              width: size.width * 3,
              child: Image.asset(
                'assets/images/Splash_Screen.png',
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
