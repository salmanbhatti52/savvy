import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/common/widgets/round_icon_button.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_four.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_one.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_six.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_three.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_two.dart';

import '../../common/widgets/custom_button.dart';
import '../../utils/color_constants.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  CarouselController buttonCarouselController = CarouselController();
  int currentPageIndex = 0;

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: _iconButton(),
            ),
            Flexible(flex: 9, child: _pageSlider()),
            Flexible(
              flex: 1,
              child: _actionButton(),
            )
          ],
        ),
      ),
    );
  }

  Widget _pageSlider() {
    return CarouselSlider(
      carouselController: buttonCarouselController,
      items: const [
        PageViewScreenOne(),
        PageViewScreenTwo(),
        PageViewScreenThree(),
        PageViewScreenFour(),
      ],
      options: CarouselOptions(
          initialPage: 0,
          onPageChanged: (index, reason) {
            currentPageIndex = index;
          },
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
          reverse: false,
          height: size.height * 0.9,
          clipBehavior: Clip.hardEdge,
          aspectRatio: 4.4),
    );
  }

  Widget _iconButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          RoundButton(
              onTap: () {
                if (currentPageIndex == 0) {
                  Navigator.pop(context);
                } else {
                  buttonCarouselController.previousPage();
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Widget _actionButton() {
    return MyButton(
      ontap: (() {
        if (currentPageIndex == 3) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const PageViewScreenSix();
            },
          ));
        } else {
          buttonCarouselController.nextPage();
        }
      }),
      radius: size.width * 0.07,
      color: ColorConstants.buttonColorLight,
      height: size.height * 0.06,
      width: size.width * 0.6,
      spreadRadius: 0,
      child: Text(
        'NEXT',
        style: GoogleFonts.lato(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
    );
  }
}
