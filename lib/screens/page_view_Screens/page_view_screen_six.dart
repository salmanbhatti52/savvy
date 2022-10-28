import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/widgets/custom_button.dart';
import '../../utils/color_constants.dart';
import '../post_page_view_screens/selected_screen.dart';

class PageViewScreenSix extends StatelessWidget {
  const PageViewScreenSix({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 2,
                child: headingText(size),
              ),
              SizedBox(
                height: size.height * 0.009,
              ),
              Flexible(
                flex: 15,
                child: Column(
                  children: [
                    Expanded(
                      flex: 14,
                      child: imageColunm(size),
                    ),
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
                  radius: size.height * 0.04,
                  color: ColorConstants.introPageTextColor,
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  spreadRadius: 2,
                  child: Text(
                    'BACK',
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
                        return const SelectedScreen();
                      },
                    ));
                  },
                  radius: size.height * 0.04,
                  color: ColorConstants.buttonColor,
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  spreadRadius: 2,
                  child: Text(
                    'NEXT',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: size.height * 0.020),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  headingText(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            'Click on the cards below to read through the Sustainable development goals. Then drop your\ntop 5 goals into the basket below!',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: size.height * 0.017),
          ),
        ),
      ],
    );
  }

  Widget imageColunm(Size size) {
    var space = size.height * 0.009;
    var elevation = 1.0;
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgsixcompnent1.png'))),
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgsixcompnent2.png'))),
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgsixcompnent3.png'))),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgsixcompnent4.png'))),
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgsixcompnent5.png'))),
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgsixcompnent6.png'))),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgcomponent7.png'))),
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgcomponent8.png'))),
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgcomponent9.png'))),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgcomponent10.png'))),
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgcomponent11.png'))),
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgcomponent12.png'))),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgcomponent13.png'))),
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgcomponent14.png'))),
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgcomponent15.png'))),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgcomponent16.png'))),
              Flexible(
                  child: Card(
                      elevation: elevation,
                      child: Image.asset(r'assets/images/pgcomponent17.png'))),
              Flexible(child: Image.asset(r'assets/images/pgviewbasket.png')),
            ],
          ),
        ),
      ],
    );
  }
}
