import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:savvy/common/widgets/reuseable_row.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_six.dart';
import 'package:savvy/services/api_urls.dart';
import 'package:savvy/utils/dialog_const.dart';
import 'package:savvy/utils/portfolio_screen_utils.dart';
import '../../common/widgets/custom_button.dart';
import '../../controllers/screen_six_controller/selected_sds_list.dart';
import '../../models/sdgs_models/update_sdgs_list.dart';
import '../../utils/color_constants.dart';

class PortFolioScreen extends StatefulWidget {
  const PortFolioScreen({super.key});
  static const String screenName = '/PortfolioScreen';

  @override
  State<PortFolioScreen> createState() => _PortFolioScreenState();
}

class _PortFolioScreenState extends State<PortFolioScreen> {
  Random random = Random();
  late Size size;
  int selected = 0;
  int itemIndex = -1;
  int sepratorIndex = 0;
  final sdgListController = Get.put(SdgsListController());
  List<Color> tileColors = [
    DialogConst.firstColor,
    DialogConst.secondColor,
    DialogConst.thirdColor,
    DialogConst.fourthColor,
    DialogConst.fifthColor,
    DialogConst.sixthColor,
    DialogConst.seventhColor,
    DialogConst.eighthColor,
    DialogConst.ninthColor,
    DialogConst.tenthColor,
    DialogConst.eleventhColor,
    DialogConst.twelthColor,
    DialogConst.thirtenColor,
    DialogConst.fourtenthColor,
  ];
  PortfolioUtils portfolioUtils = PortfolioUtils();
  List<String> leading = [];
  late List<UpdatedSdgsList> list;

  @override
  void initState() {
    super.initState();
    list = sdgListController.selectedSds;
  }

  @override
  Widget build(BuildContext context) {
    leading = portfolioUtils.tileImages;
    size = MediaQuery.of(context).size;
    return Scaffold(
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
                if (itemIndex == index) {
                  //  print("seprator index$index");
                  return Container(
                    height: size.height * 0.080,
                    width: size.width,
                    color: Color(int.parse(list[index].colorCode)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        overflow: TextOverflow.fade,
                        list[index].description.toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: size.height * 0.020,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                } else {
                  return const Divider(
                    height: 4,
                  );
                }
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
              sdgListController.selectedSds = [];
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
        'one': 20,
        'two': 20,
        'three': 20,
        'four': 20,
        'five': 20,
        'six': 20,
        'seven': 20,
        'eight': 20,
        'nine': 20,
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

  // Widget selectedList() {
  //   return Column(
  //     children: [
  //       Flexible(
  //         child: SingleChildScrollView(
  //           child: MyExpansionTile(
  //             sideContainer: Container(color: Colors.red),
  //             image: Image.asset(r'assets/images/selecteditem2.png'),
  //             tileText: const Text('Savvy App'),
  //             color: Colors.grey[300],
  //             child: Container(
  //               color: Colors.orange,
  //               height: 20,
  //               width: 100,
  //             ),
  //           ),
  //         ),
  //       ),
  //       Flexible(
  //         child: SingleChildScrollView(
  //           child: MyExpansionTile(
  //             sideContainer: Container(
  //               color: Colors.red,
  //               height: 60,
  //             ),
  //             image: Image.asset(r'assets/images/selecteditem2.png'),
  //             tileText: const Text('Savvy App'),
  //             color: Colors.grey[300],
  //             child: Container(
  //               color: Colors.orange,
  //               height: 20,
  //               width: 100,
  //             ),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 5,
  //       ),
  //       Flexible(
  //         child: SingleChildScrollView(
  //           child: MyExpansionTile(
  //             sideContainer: Container(color: Colors.red),
  //             image: Image.asset(r'assets/images/selecteditem2.png'),
  //             tileText: const Text('Savvy App'),
  //             color: Colors.grey[300],
  //             child: Container(
  //               color: Colors.orange,
  //               height: 20,
  //               width: 100,
  //             ),
  //           ),
  //         ),
  //       ),
  //       Flexible(
  //         child: SingleChildScrollView(
  //           child: MyExpansionTile(
  //             sideContainer: Container(color: Colors.red),
  //             image: Image.asset(r'assets/images/selecteditem2.png'),
  //             tileText: const Text('Savvy App'),
  //             color: Colors.grey[300],
  //             child: Container(
  //               color: Colors.orange,
  //               height: 20,
  //               width: 100,
  //             ),
  //           ),
  //         ),
  //       ),
  //       Flexible(
  //         child: SingleChildScrollView(
  //           child: MyExpansionTile(
  //             sideContainer: Container(color: Colors.red),
  //             image: Image.asset(r'assets/images/selecteditem2.png'),
  //             tileText: const Text('Savvy App'),
  //             color: Colors.grey[300],
  //             child: Container(
  //               color: Colors.orange,
  //               height: 20,
  //               width: 100,
  //             ),
  //           ),
  //         ),
  //       ),
  //       Flexible(
  //         child: SingleChildScrollView(
  //           child: MyExpansionTile(
  //             sideContainer: Container(color: Colors.red),
  //             image: Image.asset(r'assets/images/selecteditem2.png'),
  //             tileText: const Text('Savvy App'),
  //             color: Colors.grey[300],
  //             child: Container(
  //               color: Colors.orange,
  //               height: 20,
  //               width: 100,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _itemBuilder(BuildContext context, int index) {
    return SizedBox(
      height: size.height * 0.070,
      width: size.width,
      child: ReuseableRow(
          color: Colors.white,
          sideContainer: Container(
            color: Color(int.parse(list[index].colorCode)),
            // width: 10,
          ),
          image: SizedBox(
              height: size.height * 0.20,
              width: size.width * 0.10,
              child: Image.network(
                ApiUrls.baseUrl + list[index].image,
                fit: BoxFit.scaleDown,
              )),
          tileText: Text(
            "${list[index].systemSdgsId}. ${list[index].title}",
            style: GoogleFonts.poppins(
                color: ColorConstants.landingPageTitleColor,
                fontSize: size.height * 0.020),
          ),
          dropDownButton: GestureDetector(
              onTap: () {
                debugPrint('ontap');
                setState(() {
                  itemIndex = index;
                });
                //print(itemIndex.toString());
              },
              child: const Icon(
                  Icons.expand_more_sharp)) // child: MyExpansionTile(

          ),
    );
  }
}
