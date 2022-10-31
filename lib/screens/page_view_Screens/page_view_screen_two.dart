import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/utils/color_constants.dart';

class PageViewScreenTwo extends StatelessWidget {
  const PageViewScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(flex: 1, child: headingText(size)),
          Flexible(flex: 4, child: svgImage(size)),
          Flexible(flex: 1, child: _paginatinPng()),
        ],
      ),
    );
  }

  Widget headingText(Size size) {
    return Text(
      'We might have some\nquestions like..',
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          color: ColorConstants.introPageTextColor,
          fontSize: size.height * 0.030),
    );
  }

  // Widget actionButtons(Size size, BuildContext context) {
  //   return MyButton(
  //     ontap: () {
  //       Navigator.push(context, MaterialPageRoute(
  //         builder: (context) {
  //           return const PageViewScreenThree();
  //         },
  //       ));
  //     },
  //     radius: size.width * 0.07,
  //     color: ColorConstants.buttonColorLight,
  //     height: size.height * 0.06,
  //     width: size.width * 0.6,
  //     spreadRadius: 0,
  //     child: ButtonText.buttonText(size),
  //   );
  // }

  Widget svgImage(Size size) {
    return Image.asset('assets/images/pgtwopng.png');
  }

  Widget _paginatinPng() {
    return Image.asset(r'assets/images/pganation2.png');
  }

  // Widget _iconButton(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 10),
  //     child: Row(
  //       children: [
  //         RoundButton(
  //             onTap: () {
  //               Navigator.pop(context);
  //             },
  //             icon: const Icon(
  //               Icons.arrow_back_ios_sharp,
  //               color: Colors.white,
  //             ))
  //       ],
  //     ),
  //   );
  // }
}
