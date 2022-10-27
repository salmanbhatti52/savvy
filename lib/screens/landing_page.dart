import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
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
    return Container(
      color: Colors.white,
      child: ColorfulSafeArea(
        color: Colors.white,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(flex: 3, child: title(size)),
                Flexible(flex: 10, child: svgImage()),
                Flexible(flex: 1, child: actionButtons(size, context)),
              ],
            ),
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
                fontSize: size.height * 0.07,
                color: ColorConstants.landingPageTitleColor)),
      ],
    );
  }

  Widget svgImage() {
    return SizedBox(
      child: Image.asset(r'assets/images/landigpgpng.png'),
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
              radius: size.height * 0.05,
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
              radius: size.height * 0.05,
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
