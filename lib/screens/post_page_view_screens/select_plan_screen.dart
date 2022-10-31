import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_constants.dart';

class SelectPlanScreen extends StatefulWidget {
  const SelectPlanScreen({super.key});

  @override
  State<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  late Size size;
  double currentValue = 0.0;
  double currentValueTwo = 0.0;
  //final PageController _controller = PageController();
  // final GlobalKey<ScaffoldState> _scaffloldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        endDrawer: myEndDrawer(),
        appBar: _buildAppBar(),
        body: selectedPlanBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'savvy',
        style: GoogleFonts.lato(
            fontSize: size.height * 0.030,
            color: ColorConstants.introPageTextColor,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        Builder(builder: (context) {
          return InkWell(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: Icon(
              Icons.menu,
              size: size.height * 0.050,
              color: ColorConstants.introPageTextColor,
            ),
          );
        }),
        SizedBox(
          width: size.width * 0.040,
        )
      ],
    );
  }

  Widget selectedPlanBody() {
    return Center(
      child: Column(
        children: [
          Flexible(
            flex: 10,
            child: seekBarContainer(),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Flexible(
            flex: 1,
            child: Text(
              'YOUR PLANET IMPACT',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                color: ColorConstants.introPageTextColor,
                fontSize: size.height * 0.02,
              ),
            ),
          ),
          Flexible(
            flex: 10,
            child: Container(
              width: size.width * 0.7,
              height: size.height * 0.4,
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(r'assets/images/earth.png')],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget seekBarContainer() {
    return Column(
      children: [
        Flexible(
            flex: 5,
            child: Container(
              decoration: myBoxDecoration(),
              width: size.width * 0.9,
              //    color: Colors.green,
              child: SizedBox(
                width: size.width * 0.5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          'YOUR 1ST PAYMENT',
                          style: myTextStyle(),
                        ),
                      ),
                      Flexible(flex: 1, child: mySlider()),
                      Flexible(
                        flex: 1,
                        child: Text(
                          '€50',
                          style: myTextStyle(),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Flexible(
                              //  flex: 2,
                              child: SizedBox(
                                width: 5,
                              ),
                            ),
                            Flexible(
                              flex: 10,
                              child: Text(
                                'YOUR MONTHLY PAYMENTS',
                                style: myTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(flex: 1, child: mySliderTwo()),
                      Flexible(
                        flex: 1,
                        child: Text(
                          '€50',
                          style: myTextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        Flexible(
            flex: 3,
            child: Container(
              width: size.width * 0.9,
              decoration: myBoxDecorationn(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 2,
                        child: Text(
                          'Your investments after 10 years',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: size.height * 0.020),
                        )),
                    SizedBox(
                      height: size.height * 0.020,
                    ),
                    Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                                flex: 2,
                                child: SvgPicture.asset(
                                    r'assets/svgs/poundsvg.svg')),
                            Flexible(
                              flex: 1,
                              child: Text(
                                '''3128.6133333''',
                                softWrap: false,
                                style: GoogleFonts.lato(
                                  fontSize: size.height * 0.030,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget mySlider() {
    return Slider(
        label: '''200''',
        inactiveColor: Colors.grey,
        activeColor: ColorConstants.buttonColorLight,
        thumbColor: ColorConstants.buttonColorLight,
        min: 0.0,
        max: 100,
        value: currentValue,
        //  divisions: 4,
        onChanged: (value) {
          setState(() {
            currentValue = value;
          });
        });
  }

  Widget mySliderTwo() {
    return Slider(
        label: '''200''',
        inactiveColor: Colors.grey,
        activeColor: ColorConstants.buttonColorLight,
        thumbColor: ColorConstants.buttonColorLight,
        min: 0.0,
        max: 100,
        value: currentValueTwo,
        onChanged: (value) {
          setState(() {
            currentValueTwo = value;
          });
        });
  }

  myTextStyle() {
    return GoogleFonts.poppins(
      color: ColorConstants.introPageTextColor,
      fontSize: size.height * 0.020,
    );
  }

  Widget myEndDrawer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: size.width,
        color: const Color(0xFFCBF6E8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(child: Builder(builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Scaffold.of(context).closeEndDrawer();
                        },
                      );
                    })),
                    SizedBox(
                      width: size.width * 0.020,
                    )
                  ],
                )),
            Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Text(
                      textAlign: TextAlign.center,
                      'savvy',
                      style: GoogleFonts.lato(
                          fontSize: size.height * 0.030,
                          color: ColorConstants.introPageTextColor,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                )),
            SizedBox(
              height: size.height * 0.060,
            ),
            Flexible(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        child: Text(
                      'MY IMPACT',
                      style: _textStyle(),
                    )),
                    Flexible(
                        child: Text(
                      'PORTFOLIO',
                      style: _textStyle(),
                    )),
                    Flexible(
                        child: Text(
                      'LEARN',
                      style: _textStyle(),
                    )),
                    Flexible(
                        child: Text(
                      'My Profile',
                      style: _textStyle(),
                    )),
                    Flexible(
                        child: Text(
                      'Logout',
                      style: _textStyle(),
                    )),
                  ],
                )),
            Expanded(
                flex: 8,
                child: Image.asset(
                  r'assets/images/drawerpng.png',
                  fit: BoxFit.fitWidth,
                )),
          ],
        ),
      ),
    );
  }

  _textStyle() {
    return GoogleFonts.firaSans(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.040,
        fontWeight: FontWeight.w300);
  }

  _textStyleTwo() {
    return GoogleFonts.firaSans(
      color: ColorConstants.introPageTextColor,
      fontWeight: FontWeight.w600,
      fontSize: size.height * 0.030,
    );
  }

  myBoxDecoration() {
    return BoxDecoration(
      color: Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
    );
  }

  myBoxDecorationn() {
    return BoxDecoration(
      color: Colors.teal.shade100,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
