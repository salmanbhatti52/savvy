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
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.slectedPlanBg,
        drawerEnableOpenDragGesture: false,
        //endDrawer: myEndDrawer(),
        appBar: _buildAppBar(),
        body: selectedPlanBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.slectedPlanBg,
      centerTitle: true,
      title: Text(
        'Savvy',
        style: GoogleFonts.acme(
            fontSize: size.height * 0.050,
            color: ColorConstants.introPageTextColor),
      ),
      actions: [
        Builder(builder: (context) {
          return InkWell(
            // onTap: () {
            //   Scaffold.of(context).openEndDrawer();
            // },
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
                children: [SvgPicture.asset(r'assets/svgs/earthsvg.svg')],
              ),
            ),
          ),
        ],
      ),
    );
  }

  seekBarContainer() {
    return Column(
      children: [
        Flexible(
            flex: 5,
            child: Container(
              width: size.width * 0.9,
              color: Colors.white54,
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
                          'Your 1st payment',
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
        Flexible(
            flex: 3,
            child: Container(
              width: size.width * 0.9,
              color: ColorConstants.slectedPlanBg1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Flexible(
                        flex: 2,
                        child: Text(
                          'Your investments after 10 years',
                          style: GoogleFonts.raleway(
                              color: ColorConstants.introPageTextColor,
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
                                '''3128.61''',
                                style: TextStyle(
                                    fontSize: size.height * 0.030,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.introPageTextColor),
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
    return GoogleFonts.raleway(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.020,
        fontWeight: FontWeight.bold);
  }

  Widget myEndDrawer() {
    return Container(
      color: ColorConstants.slectedPlanBg,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const SizedBox(
              height: 5,
            ),
            SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(r'assets/images/app_icon.png')),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: ColorConstants.buttonColor,
              child: const ListTile(
                title: Text('End Drawer'),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: ColorConstants.buttonColor,
              child: const ListTile(
                title: Text('End Drawer'),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: ColorConstants.buttonColor,
              child: const ListTile(
                title: Text('End Drawer'),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: ColorConstants.buttonColor,
              child: const ListTile(
                title: Text('End Drawer'),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: ColorConstants.buttonColor,
              child: const ListTile(
                title: Text('End Drawer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
