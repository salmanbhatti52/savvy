import 'package:flutter/material.dart';
import 'package:savvy/screens/landing_page.dart';
import 'package:savvy/screens/splash_screen.dart';

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
        }
      },
      home: const SplashScreen(),
    );
  }
}
