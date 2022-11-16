import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:savvy/common/widgets/reuseabel_expansion_tile.dart';
import 'package:savvy/controllers/screen_six_controller/selected_sds_list.dart';
import 'package:savvy/screens/post_page_view_screens/portfolio_screen.dart';
import 'package:savvy/screens/post_page_view_screens/select_plan_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/widgets/custom_button.dart';
import '../../models/sdgs_models/update_sdgs_list.dart';
import '../../services/api_urls.dart';
import '../../utils/color_constants.dart';
import '../../utils/portfolio_screen_utils.dart';
import '../blogscreens/blog_screen_one.dart';
import '../login_page.dart';

class SelectedScreen extends StatefulWidget {
  const SelectedScreen({super.key});
  static const screenName = 'Selected Screeen';

  @override
  State<SelectedScreen> createState() => _SelectedScreenState();
}

class _SelectedScreenState extends State<SelectedScreen> {
  Color sytemUiOverlayColor = Colors.white;

  Random random = Random();
  late Size size;
  int selected = -1;
  //int itemIndex = -1;
  int sepratorIndex = 0;
  final sdgListController = Get.put(SdgsListController());
  Map<String, double> pieChartMap = {};
  // List<Color> tileColors = [
  //   DialogConst.firstColor,
  //   DialogConst.secondColor,
  //   DialogConst.thirdColor,
  //   DialogConst.fourthColor,
  //   DialogConst.fifthColor,
  //   DialogConst.sixthColor,
  //   DialogConst.seventhColor,
  //   DialogConst.eighthColor,
  //   DialogConst.ninthColor,
  //   DialogConst.tenthColor,
  //   DialogConst.eleventhColor,
  //   DialogConst.twelthColor,
  //   DialogConst.thirtenColor,
  //   DialogConst.fourtenthColor,
  // ];
  PortfolioUtils portfolioUtils = PortfolioUtils();
  List<String> leading = [];
  late List<UpdatedSdgsList> list;

  @override
  void initState() {
    super.initState();
    list = sdgListController.selectedSds;
    //  adToMap();
  }

  // Map<String, double> adToMap() {
  //   Map<String, double> chartMap = {};

  //   for (int i = 0; i < list.length; i++) {
  //     pieChartMap[list[i].toString()] =
  //         double.parse(list[i].systemSdgsId) / 100;
  //     print(pieChartMap[list[i].toString()]);
  //     print("@@@@@${double.parse(list[i].systemSdgsId)}");
  //  return chartMap;
  // }
  // }
  @override
  Widget build(BuildContext context) {
    leading = portfolioUtils.tileImages;
    size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: myEndDrawer(),
      onDrawerChanged: (isOpened) {
        if (isOpened == true) {
          setState(() {
            sytemUiOverlayColor = const Color(0xFFCBF6E8);
          });
        } else {
          setState(() {
            sytemUiOverlayColor = Colors.white;
          });
        }
      },
      appBar: _buildAppBar(),
      body: _portfolioBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
              height: size.height * 0.0257,
              child: SvgPicture.asset('assets/svgs/appnamelandingpg.svg')),
        ],
      ),
      actions: [
        Builder(builder: (context) {
          return InkWell(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: Icon(
              Icons.menu,
              size: size.height * 0.030,
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

  Widget _portfolioBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(flex: 1, child: textDescription()),
        Flexible(flex: 3, child: pieChart()),
        Flexible(
            flex: 4,
            child: ListView.separated(
              itemCount: list.length,
              physics: const BouncingScrollPhysics(),
              key: Key('builder ${selected.toString()}'),
              itemBuilder: _itemBuilder,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 5,
                );
              },
            )),
        Flexible(flex: 1, child: acitionButton()),
      ],
    );
  }

  Widget acitionButton() {
    return MyButton(
        ontap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const SelectPlanScreen();
            },
          ));
        },
        radius: size.height * 0.045,
        color: ColorConstants.buttonColorLight,
        height: size.height * 0.07,
        width: size.width * 0.6,
        spreadRadius: size.height * 0.002,
        child: Text(
          '''Let's Go''',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: size.height * 0.025,
          ),
        ));
  }

  Widget pieChart() {
    return PieChart(
      animationDuration: const Duration(seconds: 1),
      colorList: [
        Color(int.parse(list[random.nextInt(list.length)].colorCode)),
        Color(int.parse(list[random.nextInt(list.length)].colorCode)),
        Color(int.parse(list[random.nextInt(list.length)].colorCode)),
        Color(int.parse(list[random.nextInt(list.length)].colorCode)),
        Color(int.parse(list[random.nextInt(list.length)].colorCode)),
        Color(int.parse(list[random.nextInt(list.length)].colorCode)),
        Color(int.parse(list[random.nextInt(list.length)].colorCode)),
        Color(int.parse(list[random.nextInt(list.length)].colorCode)),
        Color(int.parse(list[random.nextInt(list.length)].colorCode)),
      ],
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesInPercentage: true,
        // chartValueBackgroundColor: Colors.white,
        showChartValuesOutside: true,
        showChartValueBackground: false,
        chartValueStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      legendOptions: const LegendOptions(showLegends: false),
      dataMap: const {
        '1': 20,
        '2': 20,
        '3': 20,
        '4': 20,
        '5': 20,
      },
      chartRadius: size.height * 0.20,
      chartType: ChartType.ring,
      ringStrokeWidth: size.height * 0.085,
      centerText: 'Savvy',
      centerTextStyle: GoogleFonts.lato(
          color: const Color(0xFF325698),
          fontWeight: FontWeight.w700,
          fontSize: size.height * 0.028),
    );
  }

  Widget textDescription() {
    return Text(
      textAlign: TextAlign.center,
      // maxLines: 2,
      'Savvy suggests you follow the below breakdown:',
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: size.height * 0.018,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return MyExpansionTile(
        key: Key(index.toString()), //attention
        initiallyExpanded: index == selected,
        onExpansionChanged: (newState) {
          if (newState) {
            setState(() {
              const Duration(seconds: 20000);
              selected = index;
            });
          } else {
            setState(() {
              selected = -1;
            });
          }
        },
        sideContainer: Container(
          width: 10,
          height: size.height * 0.08,
          color: Color(int.parse(list[index].colorCode)),
        ),
        image: SizedBox(
          height: size.height * 0.20,
          width: size.width * 0.10,
          child: Image.network(
            ApiUrls.baseUrl + list[index].image,
            fit: BoxFit.scaleDown,
          ),
        ),
        tileText: Text(
          "${list[index].systemSdgsId}. ${list[index].title}",
          style: GoogleFonts.poppins(
              color: ColorConstants.landingPageTitleColor,
              fontSize: size.height * 0.020),
        ),
        child: Container(
          color: Color(int.parse(list[index].colorCode)),
          height: 70,
          width: size.width,
          child: Text(
            overflow: TextOverflow.fade,
            list[index].description.toString(),
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: size.height * 0.020,
                fontWeight: FontWeight.w400),
          ),
        ));
    // // return SizedBox(
    // //   height: size.height * 0.070,
    // //   width: size.width,
    // //   child: ReuseableRow(
    // //       color: Colors.white,
    // //       sideContainer: Container(
    // //         color: Color(int.parse(list[index].colorCode)),
    // //         // width: 10,
    // //       ),
    // //       image: SizedBox(
    // //           height: size.height * 0.20,
    // //           width: size.width * 0.10,
    // //           child: Image.network(
    // //             ApiUrls.baseUrl + list[index].image,
    // //             fit: BoxFit.scaleDown,
    // //           )),
    // //       tileText: Text(
    // //         "${list[index].systemSdgsId}. ${list[index].title}",
    // //         style: GoogleFonts.poppins(
    // //             color: ColorConstants.landingPageTitleColor,
    // //             fontSize: size.height * 0.020),
    // //       ),
    // //       dropDownButton: GestureDetector(
    // //           onTap: () {
    // //             debugPrint('ontap');
    // //             setState(() {
    // //               itemIndex = index;
    // //             });
    // //             //print(itemIndex.toString());
    // //           },
    // //           child: const Icon(
    // //               Icons.expand_more_sharp)) // child: MyExpansionTile(

    // //       ),
    // );
  }

  Widget myEndDrawer() {
    return Container(
      width: size.width,
      height: size.height,
      color: const Color(0xFFCBF6E8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Flexible(flex: 1, child: SizedBox()),
          Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                      flex: 2,
                      child: Builder(builder: (context) {
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
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                        height: size.height * 0.027,
                        child: SvgPicture.asset(
                            'assets/svgs/appnamelandingpg.svg')),
                  ),
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
                  Flexible(child: Builder(builder: (context) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, SelectPlanScreen.screenName);
                      },
                      child: Text(
                        'MY IMPACT',
                        style: _textStyle(),
                      ),
                    );
                  })),
                  Flexible(
                      child: InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(
                          context, PortFolioScreen.screenName);
                    },
                    child: Text(
                      'PORTFOLIO',
                      style: _textStyle(),
                    ),
                  )),
                  Flexible(
                      child: InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(context, BlogScreen.screenName);
                    },
                    child: Text(
                      'LEARN',
                      style: _textStyle(),
                    ),
                  )),
                  Flexible(
                      child: InkWell(
                    onTap: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setBool('loggedIn', false);
                      print(pref.getBool('loggedIn'));
                      if (mounted) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginPage.screenName, (route) => false);
                      }
                    },
                    child: Text(
                      'Logout',
                      style: _textStyle(),
                    ),
                  )),
                  const Flexible(
                    child: SizedBox(),
                  ),
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
    );
  }

  _textStyle() {
    return GoogleFonts.firaSans(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.040,
        fontWeight: FontWeight.w300);
  }
}

// if (itemIndex == index) {
//                   //  print("seprator index$index");
//                   return Container(
//                     height: size.height * 0.080,
//                     width: size.width,
//                     color: Color(int.parse(list[index].colorCode)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
                      // child: Text(
                      //   overflow: TextOverflow.fade,
                      //   list[index].description.toString(),
                      //   style: GoogleFonts.poppins(
                      //       color: Colors.black,
                      //       fontSize: size.height * 0.020,
                      //       fontWeight: FontWeight.w400),
                      // ),
//                     ),
//                   );
//                 } else {
//                   return const Divider(
//                     height: 4,
//                   );
//                 }