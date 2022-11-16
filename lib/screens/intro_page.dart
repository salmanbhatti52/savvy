import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/common/widgets/custom_button.dart';
import 'package:savvy/controllers/intro_page_controller.dart';
import 'package:savvy/models/user.dart';
import 'package:savvy/screens/dialouges/not_found_sdg.dart';
import 'package:savvy/screens/features/updateuser_screen.dart';
import 'package:savvy/screens/page_view_Screens/page_view.dart';
import 'package:savvy/utils/color_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  static const String screenName = 'Intro';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final getName = Get.put(IntroPageController());
  String userName = '';

  @override
  void initState() {
    //  print('intro page int');
    super.initState();
    getUserName();
  }

  void getUserName() async {
//print('intro page getusername');
    SharedPreferences pref = await SharedPreferences.getInstance();
    userName = pref.getString('UserName').toString();
    //  print(userName);
  }

  @override
  Widget build(BuildContext context) {
    print(userName);
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
            child: Stack(
              // alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  r'assets/svgs/intropagesvg.svg',
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                    top: size.height * 0.12,
                    left: size.width * 0.22,
                    child: Text(
                      'Hello $userName',
                      style: GoogleFonts.firaSans(
                          fontSize: size.height * 0.030,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.introPageTextColor),
                    )),
              ],
            )),
        Flexible(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: welcomeText(size, context)),
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
  }

  Widget welcomeText(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return const SdgDialog();
          },
        );
      },
      child: Text(
        'Welcome to Savvy.',
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: size.height * 0.040,
            color: ColorConstants.introPageTextColor),
      ),
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
            return const MyPageView();
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

  // AppBar _buldAppBar() {
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
