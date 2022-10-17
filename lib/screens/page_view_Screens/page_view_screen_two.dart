import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_three.dart';
import 'package:savvy/utils/color_constants.dart';

import '../../common/widgets/custom_button.dart';

class PageViewScreenTwo extends StatelessWidget {
  const PageViewScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Expanded(flex: 1, child: headingText(size)),
              Expanded(flex: 4, child: svgImage(size)),
              Expanded(flex: 1, child: actionButtons(size, context)),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: SizedBox(
              child: MyButton(
                  ontap: () {
                    Navigator.pop(context);
                  },
                  radius: size.height * 0.02,
                  color: ColorConstants.introPageTextColor,
                  height: size.height * 0.05,
                  width: size.width * 0.4,
                  spreadRadius: 2,
                  child: Text(
                    'Back',
                    style: TextStyle(
                        color: Colors.white, fontSize: size.height * 0.020),
                  )),
            ),
          ),
          Flexible(
            child: SizedBox(
              child: MyButton(
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const PageViewScreenThree();
                      },
                    ));
                  },
                  radius: size.height * 0.02,
                  color: ColorConstants.buttonColor,
                  height: size.height * 0.05,
                  width: size.width * 0.4,
                  spreadRadius: 2,
                  child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white, fontSize: size.height * 0.020),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget svgImage(Size size) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: containerGradient(),
          ),
        ),
        Positioned(
          top: size.height * 0.099,
          left: size.width * 0.080,
          child: SizedBox(
            height: size.height * 0.4,
            width: size.width * 0.8,
            child: SvgPicture.asset(r'assets/svgs/secondpgsvg.svg'),
          ),
        ),
      ],
    );
  }

  LinearGradient containerGradient() {
    return const LinearGradient(colors: [
      ColorConstants.gradientColorOne,
      ColorConstants.gradientColorTwo,
      ColorConstants.gradientColorThree,
    ]);
  }
}
