import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/common/widgets/custom_button.dart';
import 'package:savvy/models/user.dart';
import 'package:savvy/screens/features/updateuser_screen.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_one.dart';
import 'package:savvy/utils/color_constants.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  static const String screenName = 'Intro';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user = ModalRoute.of(context)!.settings.arguments as User?;

    return SafeArea(
      child: Scaffold(
        drawer: _buildDrawer(context, user),
        appBar: _buldAppBar(),
        body: Center(child: introPageBody(size, context)),
      ),
    );
  }

  Widget introPageBody(Size size, BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            right: size.width * 0.71,
            child: SizedBox(
              height: size.height * 0.19,
              child: SvgPicture.asset(r'assets/svgs/intropageleaf.svg'),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 6,
                child: SvgPicture.asset(r'assets/svgs/intropagesvg.svg')),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: welcomeText(size)),
                  Expanded(flex: 3, child: descriptionText(size)),
                  Expanded(flex: 1, child: introText(size)),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Expanded(
                    child: buttonNext(size, context),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget welcomeText(Size size) {
    return Text(
      'Welcome to Savvy.',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size.height * 0.030,
          color: ColorConstants.introPageTextColor),
    );
  }

  Widget descriptionText(Size size) {
    return Text(
      'We want you to feel cool, calm\nand collected about sustainable\ninvesting and your finances in\ngeneral.',
      style: TextStyle(
          fontSize: size.height * 0.025,
          color: ColorConstants.introPageTextColor),
    );
  }

  Widget introText(Size size) {
    return Text(
      'That’s what we call being\nSavvy.',
      style: TextStyle(
          fontSize: size.height * 0.025,
          color: ColorConstants.introPageTextColor),
      textAlign: TextAlign.center,
    );
  }

  Widget buttonNext(Size size, BuildContext context) {
    return MyButton(
        ontap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const PageViewScreenOne();
            },
          ));
        },
        radius: size.height * 0.02,
        color: ColorConstants.buttonColor,
        height: size.height * 0.1,
        width: size.width * 0.4,
        spreadRadius: 2,
        child: Text(
          'Start Intro',
          style: GoogleFonts.raleway(
              fontSize: size.height * 0.02, fontWeight: FontWeight.bold),
        ));
  }

  _buldAppBar() {
    return AppBar(
      elevation: 0,
      leading: Builder(
        builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu_open,
                color: Colors.green,
              ));
        },
      ),
      backgroundColor: Colors.transparent,
    );
  }

  _buildDrawer(BuildContext context, User? user) {
    return Drawer(
      backgroundColor: ColorConstants.buttonColor,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Update Info"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UpdateScreen(
                    user: user,
                  );
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
