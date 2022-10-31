import 'package:flutter/material.dart';
import 'package:savvy/screens/intro_page.dart';
import 'package:savvy/screens/landing_page.dart';
import 'package:savvy/screens/login_page.dart';
import 'package:savvy/screens/post_page_view_screens/chosed_goals_Screen.dart';
import 'package:savvy/screens/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: const ChoosedGoalsScreen(),
        routes: {
          LandingPage.screenName: (context) {
            return const LandingPage();
          },
          IntroPage.screenName: (context) {
            return const IntroPage();
          },
          LoginPage.screenName: (context) {
            return const LoginPage();
          },
          SignUpPage.screenName: (context) {
            return const SignUpPage();
          },
        });
  }
}
