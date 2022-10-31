import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_constants.dart';
import '../../utils/strings.dart';

class PageViewScreenOne extends StatelessWidget {
  const PageViewScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(flex: 2, child: _headingText(size)),
        Flexible(flex: 2, child: _descriptonText(size)),
        Flexible(flex: 9, child: _svgImage(size)),
        Flexible(flex: 1, child: _paginatinPng()),
      ],
    );
  }

  Widget _headingText(Size size) {
    return Text(
      MyConstantStrings.headingPgViewPgOne,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: ColorConstants.introPageTextColor,
          fontSize: size.height * 0.04),
    );
  }

  Widget _descriptonText(Size size) {
    return Text(
      textAlign: TextAlign.center,
      MyConstantStrings.descriptionPgViewPgOne,
      style: GoogleFonts.poppins(
          color: ColorConstants.introPageTextColor,
          fontSize: size.height * 0.023),
    );
  }

  Widget _svgImage(Size size) {
    return Image.asset(
      r'assets/images/pgview1png.png',
      fit: BoxFit.fitWidth,
    );
  }

  Widget _paginatinPng() {
    return Image.asset(r'assets/images/pgnation1.png');
  }
}

// ColorfulSafeArea(
//       color: Colors.white,
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Flexible(flex: 1, child: _iconButton(context)),
//               Flexible(flex: 1, child: headingText(size)),
//               Flexible(flex: 1, child: descriptonText(size)),
//               Flexible(flex: 6, child: svgImage(size)),
//               Flexible(flex: 1, child: actionButtons(size, context)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// Widget headingText(Size size) {
//   return Text(
//     MyConstantStrings.headingPgViewPgOne,
//     textAlign: TextAlign.center,
//     style: GoogleFonts.poppins(
//         fontWeight: FontWeight.w500,
//         color: ColorConstants.introPageTextColor,
//         fontSize: size.height * 0.04),
//   );
// }

//   Widget actionButtons(Size size, BuildContext context) {
//     return MyButton(
//       ontap: () {
//         Navigator.push(context, MaterialPageRoute(
//           builder: (context) {
//             return const PageViewScreenTwo();
//           },
//         ));
//       },
//       radius: size.width * 0.07,
//       color: ColorConstants.buttonColorLight,
//       height: size.height * 0.06,
//       width: size.width * 0.6,
//       spreadRadius: 0,
//       child: ButtonText.buttonText(size),
//     );
//   }

  // Widget svgImage(Size size) {
  //   return Image.asset(
  //     r'assets/images/pgview1png.png',
  //     fit: BoxFit.fitWidth,
  //   );
  // }

  // descriptonText(Size size) {
  //   return Text(
  //     textAlign: TextAlign.center,
  //     MyConstantStrings.descriptionPgViewPgOne,
  //     style: GoogleFonts.poppins(
  //         color: ColorConstants.introPageTextColor,
  //         fontSize: size.height * 0.023),
  //   );
  // }

//   Widget _iconButton(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         children: [
//           RoundButton(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(
//                 Icons.arrow_back_ios_sharp,
//                 color: Colors.white,
//               ))
//         ],
//       ),
//     );
