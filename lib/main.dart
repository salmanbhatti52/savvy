import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savvy/screens/blogscreens/blog_screen_one.dart';
import 'package:savvy/screens/features/reset_screen.dart';
import 'package:savvy/screens/intro_page.dart';
import 'package:savvy/screens/landing_page.dart';
import 'package:savvy/screens/login_page.dart';
import 'package:savvy/screens/post_page_view_screens/chosed_goals_screen.dart';
import 'package:savvy/screens/post_page_view_screens/portfolio_screen.dart';
import 'package:savvy/screens/post_page_view_screens/select_plan_screen.dart';
import 'package:savvy/screens/post_page_view_screens/selected_screen.dart';
import 'package:savvy/screens/signup_page.dart';
import 'package:savvy/screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    //  statusBarBrightness: Brightness.dark,
  ));
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
        home: const SplashScreen(),
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
          SelectedScreen.screenName: (context) {
            return const SelectedScreen();
          },
          BlogScreen.screenName: (context) {
            return const BlogScreen();
          },
          ChoosedGoalsScreen.screenName: (context) =>
              const ChoosedGoalsScreen(),
          PortFolioScreen.screenName: (context) => const PortFolioScreen(),
          SelectPlanScreen.screenName: (context) => const SelectPlanScreen(),
          ResetScreen.screenName: (context) => const ResetScreen(),
        });
  }
}
