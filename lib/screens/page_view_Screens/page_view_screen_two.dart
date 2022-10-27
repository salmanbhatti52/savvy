import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_three.dart';
import 'package:savvy/utils/color_constants.dart';

import '../../common/widgets/custom_button.dart';
import '../../common/widgets/page_view_text.dart';
import '../../common/widgets/round_icon_button.dart';

class PageViewScreenTwo extends StatelessWidget {
  const PageViewScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(flex: 1, child: _iconButton(context)),
              Flexible(flex: 1, child: headingText(size)),
              Flexible(flex: 4, child: svgImage(size)),
              Flexible(flex: 1, child: actionButtons(size, context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget headingText(Size size) {
    return Text(
      'We might have some\nquestions like..',
      textAlign: TextAlign.center,
      style: TextStyle(
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
            return const PageViewScreenThree();
          },
        ));
      },
      radius: size.width * 0.07,
      color: ColorConstants.buttonColorLight,
      height: size.height * 0.06,
      width: size.width * 0.6,
      spreadRadius: 0,
      child: ButtonText.buttonText(size),
    );
  }

  Widget svgImage(Size size) {
    return Image.asset('assets/images/pgtwopng.png');
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
                Icons.arrow_back,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
