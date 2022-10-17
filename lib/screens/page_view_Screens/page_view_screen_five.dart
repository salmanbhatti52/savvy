import 'package:flutter/material.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_six.dart';

import '../../common/widgets/custom_button.dart';
import '../../utils/color_constants.dart';
import '../../utils/strings.dart';

class PageViewScreenFive extends StatelessWidget {
  const PageViewScreenFive({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: svgImage(size)),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: headingText(size),
                    ),
                    Expanded(flex: 2, child: descriptonText(size)),
                    Expanded(flex: 2, child: actionButtons(size, context)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
                        return const PageViewScreenSix();
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
    return Image.asset(r'assets/images/pgscreenfive.png');
  }

  LinearGradient containerGradient() {
    return const LinearGradient(colors: [
      ColorConstants.gradientColorOne,
      ColorConstants.gradientColorTwo,
      ColorConstants.gradientColorThree,
    ]);
  }

  headingText(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            'They sound great..but how are they going to help me with\ninvesting?',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorConstants.introPageTextColor,
                fontSize: size.height * 0.027),
          ),
        ),
      ],
    );
  }

  Widget descriptonText(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            maxLines: 5,
            MyConstantStrings.descriptionPgViewPgFive,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorConstants.introPageTextColor,
                fontSize: size.height * 0.025),
          ),
        ),
      ],
    );
  }
}
