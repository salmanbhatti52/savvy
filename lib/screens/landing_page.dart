import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/screens/signup_page.dart';
import 'package:savvy/utils/color_constants.dart';

import '../common/widgets/custom_button.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  static const String screenName = 'Landig Page';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: size.height * 0.03,
                ),
              ),
              Expanded(flex: 1, child: title(size)),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(flex: 7, child: svgImage()),
              SizedBox(
                height: size.height * 0.03,
              ),
              Expanded(flex: 1, child: actionButtons(size, context)),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: size.height * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget title(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('Savvy',
            style: GoogleFonts.acme(
                fontSize: size.height * 0.08,
                color: ColorConstants.landingPageTitleColor)),
      ],
    );
  }

  Widget svgImage() {
    return SizedBox(
      child: SvgPicture.asset(r'assets/svgs/svg_one.svg'),
    );
  }

  Widget actionButtons(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 1,
            child: MyButton(
              ontap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  },
                ));
              },
              width: size.width * 0.4,
              height: size.height * 0.1,
              radius: size.height * 0.03,
              spreadRadius: 2,
              color: ColorConstants.buttonColorLight,
              child: Text(
                'Log In',
                style: GoogleFonts.aBeeZee(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )),
        SizedBox(
          width: size.width * 0.03,
        ),
        Expanded(
            flex: 1,
            child: MyButton(
              ontap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SignUpPage();
                  },
                ));
              },
              spreadRadius: 2,
              width: size.width * 0.4,
              height: size.height * 0.1,
              radius: size.height * 0.03,
              color: ColorConstants.buttonColor,
              child: Text(
                'Sign Up',
                style: GoogleFonts.aBeeZee(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }
}
