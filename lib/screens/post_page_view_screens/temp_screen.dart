import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:savvy/screens/page_view_Screens/page_view_screen_six.dart';

import '../../common/widgets/custom_button.dart';
import '../../common/widgets/reuseable_row.dart';
import '../../utils/color_constants.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({super.key});
  static const String screenName = 'temp screen';

  @override
  State<TempScreen> createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  var dropDownFlex = 0;
  bool showDropDown = false;
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   centerTitle: true,
        //   title: Text(
        //     'Savvy',
        //     style: GoogleFonts.lato(
        //       fontSize: size.height * 0.035,
        //       fontWeight: FontWeight.w600,
        //       color: ColorConstants.introPageTextColor,
        //     ),
        //   ),
        // ),
        body: selectScreenBody(),
      ),
    );
  }

  Widget selectScreenBody() {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: SizedBox(
                          width: size.width * 0.2,
                          child: SvgPicture.asset(
                              'assets/svgs/appnamelandingpg.svg'))),
                ],
              )),
          // _verticalSpace(size.height * 0.001),
          Flexible(flex: 1, child: textDescription()),
          // _verticalSpace(size.height * 0.005),
          Flexible(flex: 5, child: pieChart()),
          //  _verticalSpace(size.height * 0.020),
          Flexible(flex: 6, child: selectedList()),
          // _verticalSpace(size.height * 0.030),
          Flexible(flex: 3, child: acitionButton()),
        ]),
      ),
    );
  }

  Widget pieChart() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Material(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(size.height * 0.40),
          elevation: 5,
          child: Container(
            //     clipBehavior: Clip.hardEdge,
            height: size.height * 0.65,
            width: size.width * 0.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.40),
              color: Colors.white10,
            ),
          ),
        ),
        PieChart(
          animationDuration: const Duration(seconds: 1),
          colorList: const [
            Color(0xFFDCF0E5),
            Color(0xFFC9BAF2),
            Color(0xFF016654),
            Color(0xFF202445),
            Color(0xFF02E0A3),
          ],
          chartValuesOptions: ChartValuesOptions(
            showChartValuesInPercentage: true,
            // chartValueBackgroundColor: Colors.white,
            showChartValuesOutside: true,
            showChartValueBackground: false,
            chartValueStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: size.height * 0.013),
          ),
          legendOptions: const LegendOptions(showLegends: false),
          dataMap: const {
            'one': 20,
            'two': 20,
            'three': 20,
            'four': 20,
            'five': 20,
          },
          chartRadius: size.height * 0.20,
          chartType: ChartType.ring,
          ringStrokeWidth: size.height * 0.085,
          centerText: 'Savvy',
          centerTextStyle: GoogleFonts.lato(
              color: const Color(0xFF325698),
              fontWeight: FontWeight.w700,
              fontSize: size.height * 0.030),
        ),
      ],
    );
  }

  Widget acitionButton() {
    return MyButton(
        ontap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
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
          '''Reselect SDG’s''',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: size.height * 0.025,
          ),
        ));
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

  Widget selectedList() {
    //  var flex = 1;
    return Column(
      children: [
        Flexible(
          child: ReuseableRow(
              color: Colors.grey.withOpacity(0.1),
              sideContainer: Container(
                color: Colors.red,
              ),
              image: Image.asset(r'assets/images/selecteditemm.png'),
              tileText: Text(
                'No Poverty',
                style: _textStyle(),
              ),
              dropDownButton: const Icon(
                Icons.expand_more,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        Flexible(
          child: ReuseableRow(
              sideContainer: Container(
                color: Colors.blue,
              ),
              image: Image.asset(r'assets/images/selecteditem2.png'),
              tileText: Text(
                'Zero Hunger',
                style: _textStyle(),
              ),
              dropDownButton: const Icon(
                Icons.expand_more,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        Flexible(
          child: ReuseableRow(
              color: Colors.grey.withOpacity(0.1),
              sideContainer: Container(
                color: Colors.yellow,
              ),
              image: Image.asset(r'assets/images/selecteditem3.png'),
              tileText: Text(
                'Health & Well-Being',
                style: _textStyle(),
              ),
              dropDownButton: const Icon(
                Icons.expand_more,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        Flexible(
          child: ReuseableRow(
              sideContainer: Container(
                color: Colors.teal,
              ),
              image: Image.asset(r'assets/images/selecteditem4.png'),
              tileText: Text(
                'Quality Education',
                style: _textStyle(),
              ),
              dropDownButton: const Icon(
                Icons.expand_more,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        Flexible(
          child: ReuseableRow(
              color: Colors.grey.withOpacity(0.1),
              sideContainer: Container(
                color: Colors.green,
              ),
              image: Image.asset(r'assets/images/selecteditem5.png'),
              tileText: Text(
                'Gender Equality',
                style: _textStyle(),
              ),
              dropDownButton: const Icon(
                Icons.expand_more,
              )),
        ),
      ],
    );
  }

  _textStyle() {
    return GoogleFonts.poppins(
      fontSize: size.height * 0.022,
      color: ColorConstants.introPageTextColor,
    );
  }
}
