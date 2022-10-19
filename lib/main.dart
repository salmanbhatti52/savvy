import 'package:flutter/material.dart';
import 'package:savvy/screens/intro_page.dart';
import 'package:savvy/screens/landing_page.dart';
import 'package:savvy/screens/login_page.dart';
import 'package:savvy/screens/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        LandingPage.screenName: (context) {
          return const LandingPage();
        },
        IntroPage.screenName: (context) {
          return const IntroPage();
        },
        SignUpPage.screenName: (context) {
          return const SignUpPage();
        },
        LoginPage.screenName: (context) {
          return const LoginPage();
        }
      },
      home: const LandingPage(),
    );
  }
}
