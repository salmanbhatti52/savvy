import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_six.dart';
import 'package:savvy/screens/post_page_view_screens/select_plan_screen.dart';
import 'package:savvy/services/api_urls.dart';
import 'package:savvy/utils/portfolio_screen_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/reuseabel_expansion_tile.dart';
import '../../controllers/screen_six_controller/selected_sds_list.dart';
import '../../models/sdgs_models/update_sdgs_list.dart';
import '../../utils/color_constants.dart';
import '../blogscreens/blog_screen_one.dart';
import '../features/delete_my_account.dart';
import '../login_page.dart';

class PortFolioScreen extends StatefulWidget {
  const PortFolioScreen({super.key});
  static const String screenName = '/PortfolioScreen';

  @override
  State<PortFolioScreen> createState() => _PortFolioScreenState();
}

class _PortFolioScreenState extends State<PortFolioScreen> {
  Random random = Random();
  late Size size;
  int selected = -1;
  // int itemIndex = -1;
  int sepratorIndex = 0;
  final controller = Get.find<SdgsListController>();

  PortfolioUtils portfolioUtils = PortfolioUtils();
  List<String> leading = [];
  late List<UpdatedSdgsList> list;
  // List<Color> colorList = [];
  Color sytemUiOverlayColor = Colors.white;
  Map<String, double> pieChartMap = {};
  List<Color> colorList = [
    const Color(0xFFDCD4F8),
    const Color(0xFFCBF6E8),
    const Color(0xFF4267AB),
    const Color(0xFF58E5AA),
    const Color(0xFf016653),
  ];

  @override
  void initState() {
    super.initState();
    list = controller.selectedSds;
    pieChartMap = adToMap();
  }

  Map<String, double> adToMap() {
    Map<String, double> chartMap = {};
    for (int i = 0; i < list.length; i++) {
      chartMap[i.toString()] = 100 / list.length;
      colorList.add(Color(int.parse(list[i].colorCode.toString())));
      // debugPrint(chartMap[i.toString()].toString());
      // debugPrint((100 / list.length).toString());
    }
    return chartMap;
  }

  @override
  Widget build(BuildContext context) {
    leading = portfolioUtils.tileImages;
    size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: myEndDrawer(),
      onEndDrawerChanged: (isOpened) {
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
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: sytemUiOverlayColor,
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
              controller.selectedSds = [];
              return const PageViewScreenSix();
            },
          ));
        },
        radius: size.height * 0.045,
        color: ColorConstants.buttonColorLight,
        height: size.height * 0.07,
        width: size.width * 0.6,
        spreadRadius: size.height * 0.002,
        child: Text(
          '''RESELECT SDG'S''',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: size.height * 0.025,
          ),
        ));
  }

  Widget pieChart() {
    return PieChart(
      animationDuration: const Duration(seconds: 1),
      colorList: colorList,
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesInPercentage: true,
        // chartValueBackgroundColor: Colors.white,
        showChartValuesOutside: true,
        showChartValueBackground: false,
        chartValueStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      legendOptions: const LegendOptions(showLegends: false),
      dataMap: pieChartMap,
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
          color: colorList[index],
        ),
        image: SizedBox(
          height: size.height * 0.20,
          width: size.width * 0.10,
          child: Image.network(
            ApiUrls.baseUrl + list[index].image.toString(),
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
          color: colorList[index],
          height: size.height * 0.085,
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.040, vertical: size.height * 0.005),
            child: Text(
              overflow: TextOverflow.fade,
              list[index].description.toString(),
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: size.height * 0.020,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ));
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
                        Scaffold.of(context).closeEndDrawer();
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
                      controller.selectedSds = [];
                      // print(pref.getBool('loggedIn'));
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
                  Flexible(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, DeleteMyAccount.screenName),
                      child: Text(
                        '(Delete My Account)',
                        style: deleteAccountStyle(),
                      ),
                    ),
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

  deleteAccountStyle() {
    return GoogleFonts.firaSans(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.017,
        fontWeight: FontWeight.w300);
  }

  _textStyle() {
    return GoogleFonts.firaSans(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.040,
        fontWeight: FontWeight.w300);
  }
}
