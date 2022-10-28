import 'package:colorful_safe_area/colorful_safe_area.dart';
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

    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        drawer: _buildDrawer(context, user),
        //   appBar: _buldAppBar(),
        body: Center(child: introPageBody(size, context)),
      ),
    );
  }

  Widget introPageBody(Size size, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
            flex: 6,
            child: SvgPicture.asset(
              r'assets/svgs/intropagesvg.svg',
              fit: BoxFit.fitWidth,
            )),
        Flexible(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: welcomeText(size)),
              Flexible(flex: 3, child: descriptionText(size)),
              Flexible(flex: 2, child: introText(size)),
              SizedBox(
                height: size.height * 0.03,
              ),
              Flexible(
                child: buttonNext(size, context),
              ),
              // const Flexible(
              //   flex: 1,
              //   child: SizedBox(),
              // ),
            ],
          ),
        ),
      ],
    );

    // return Stack(
    //   children: [
    //     Positioned(
    //         bottom: 0,
    //         right: size.width * 0.71,
    //         child: SizedBox(
    //           height: size.height * 0.19,
    //           //   child: SvgPicture.asset(r'assets/svgs/intropageleaf.svg'),
    //         )),

    //   ],
    // );
  }

  Widget welcomeText(Size size) {
    return Text(
      'Welcome to Savvy.',
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: size.height * 0.040,
          color: ColorConstants.introPageTextColor),
    );
  }

  Widget descriptionText(Size size) {
    return Text(
      maxLines: 4,
      textAlign: TextAlign.center,
      'We want you to feel cool,\ncalm and collected about\nsustainable investing and\nyour finances in general. ',
      style: GoogleFonts.poppins(
          fontSize: size.height * 0.020, color: Colors.grey),
    );
  }

  Widget introText(Size size) {
    return Text(
      'That’s what we call\nbeing Savvy.',
      style: TextStyle(
          fontSize: size.height * 0.030,
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
      radius: size.width * 0.07,
      color: ColorConstants.buttonColorLight,
      height: size.height * 0.06,
      width: size.width * 0.6,
      spreadRadius: 0,
      child: Text(
        'START INTRO',
        style: GoogleFonts.lato(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
    );
  }

  AppBar _buldAppBar() {
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
