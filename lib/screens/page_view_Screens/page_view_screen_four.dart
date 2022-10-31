import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/common/widgets/page_view_text.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_six.dart';

import '../../common/widgets/custom_button.dart';
import '../../common/widgets/round_icon_button.dart';
import '../../utils/color_constants.dart';

class PageViewScreenFour extends StatelessWidget {
  const PageViewScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 2, child: svgImage(size)),
        Expanded(flex: 1, child: descriptonText(size)),
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _paginatinPng(),
              SizedBox(
                height: size.height * 0.032,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _paginatinPng() {
    return Image.asset(r'assets/images/pgnation3.png');
  }

  Widget headingText(Size size) {
    return Text(
      'We need a plan.',
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: ColorConstants.introPageTextColor,
          fontSize: size.height * 0.04),
    );
  }

  Widget actionButtons(Size size, BuildContext context) {
    return MyButton(
        ontap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const PageViewScreenSix();
            },
          ));
        },
        radius: size.width * 0.07,
        color: ColorConstants.buttonColorLight,
        height: size.height * 0.06,
        width: size.width * 0.6,
        spreadRadius: 0,
        child: ButtonText.buttonText(size));
  }

  Widget svgImage(Size size) {
    return Image.asset(r'assets/images/pgscreenfour.png');
  }

  descriptonText(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            'The UN has 17 Goals\nfor Sustainable\n Developmentby 2030',
            textAlign: TextAlign.center,
            //  MyConstantStrings.descriptionPgViewPgThree,
            style: GoogleFonts.poppins(
                color: ColorConstants.introPageTextColor,
                fontWeight: FontWeight.w500,
                fontSize: size.height * 0.030),
          ),
        ),
      ],
    );
  }

  Widget _iconButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          RoundButton(
              onTap: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
