import 'package:flutter/material.dart';
import 'package:savvy/common/widgets/custom_button.dart';
import 'package:savvy/utils/color_constants.dart';

import '../../utils/strings.dart';
import 'page_view_screen_four.dart';

class PageViewScreenThree extends StatelessWidget {
  const PageViewScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(flex: 1, child: headingText(size)),
              Expanded(flex: 12, child: svgImage(size)),
              Expanded(flex: 2, child: descriptonText(size)),
              Expanded(flex: 2, child: actionButtons(size, context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget headingText(Size size) {
    return Text(
      'We need a plan.',
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
                        return const PageViewScreenFour();
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: containerGradient(),
                ),
              ),
              Positioned(
                right: size.width * 0.10,
                top: size.height * 0.23,
                left: size.width * 0.33,
                child: SizedBox(
                  height: size.height * 0.4,
                  width: size.width * 0.7,
                  child: Image.asset(r'assets/images/pageviewthreeimg.png'),
                ),
              ),
            ],
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

  descriptonText(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            textAlign: TextAlign.center,
            MyConstantStrings.descriptionPgViewPgThree,
            style: TextStyle(
                color: ColorConstants.introPageTextColor,
                fontSize: size.height * 0.025),
          ),
        ),
      ],
    );
  }
}
