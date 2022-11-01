import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:savvy/common/widgets/custom_button.dart';
import 'package:savvy/common/widgets/reuseable_row.dart';
import 'package:savvy/screens/post_page_view_screens/select_plan_screen.dart';
import 'package:savvy/utils/color_constants.dart';

class SelectedScreen extends StatefulWidget {
  const SelectedScreen({super.key});

  @override
  State<SelectedScreen> createState() => _SelectedScreenState();
}

class _SelectedScreenState extends State<SelectedScreen> {
  var dropDownFlex = 0;
  bool showDropDown = false;
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
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
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
      Flexible(flex: 3, child: textDescription()),
      Flexible(flex: 8, child: pieChart()),
      Flexible(flex: 9, child: selectedList()),
      Flexible(flex: 3, child: acitionButton()),
    ]);
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
          '''LET'S GO!''',
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
    var flex = 1;
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

  Widget _verticalSpace() {
    return SizedBox(
      height: size.height * 0.009,
    );
  }

  _textStyle() {
    return GoogleFonts.poppins(
      fontSize: size.height * 0.022,
      color: ColorConstants.introPageTextColor,
    );
  }
}
// Widget selectedList() {
//     var flex = 1;
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Flexible(
//           flex: flex,
//           child: ReuseableRow(
//               listTile: ListTile(
//                 title: Text(
//                   'No Poverty',
//                   style: _textStyle(),
//                 ),
//                 tileColor: Colors.grey.withOpacity(0.2),
//                 leading: Image.asset(
//                   r'assets/images/selecteditemm.png',
//                   alignment: Alignment.center,
//                 ),
//                 trailing: const Icon(
//                   Icons.expand_circle_down,
//                   color: ColorConstants.introPageTextColor,
//                 ),
//               ),
//               sideContainer: Container(
//                 color: ColorConstants.buttonColorLight,
//               )),
//         ),
//         _verticalSpace(),
//         Flexible(
//             flex: flex,
//             child: ReuseableRow(
//                 listTile: ListTile(
//                   title: Text(
//                     'Zero Hunger',
//                     style: _textStyle(),
//                   ),
//                   leading: Image.asset(
//                     r'assets/images/selecteditem2.png',
//                     alignment: Alignment.center,
//                   ),
//                   trailing: const Icon(
//                     Icons.expand_circle_down,
//                     color: ColorConstants.introPageTextColor,
//                   ),
//                 ),
//                 sideContainer: Container(
//                   color: Colors.purple,
//                 ))),
//         _verticalSpace(),
//         Flexible(
//             flex: flex,
//             child: ReuseableRow(
//                 listTile: ListTile(
//                   title: Text(
//                     'Health & Well-Being',
//                     style: _textStyle(),
//                   ),
//                   leading: Image.asset(
//                     r'assets/images/selecteditem3.png',
//                     alignment: Alignment.center,
//                   ),
//                   tileColor: Colors.grey.withOpacity(0.2),
//                   trailing: const Icon(
//                     Icons.expand_circle_down,
//                     color: ColorConstants.introPageTextColor,
//                   ),
//                 ),
//                 sideContainer: Container(
//                   color: const Color(0xFFFDC842),
//                 ))),
//         _verticalSpace(),
//         Flexible(
//             flex: flex,
//             child: ReuseableRow(
//                 listTile: ListTile(
//                   title: Text(
//                     'Quality Education',
//                     style: _textStyle(),
//                   ),
//                   leading: Image.asset(
//                     r'assets/images/selecteditem4.png',
//                     alignment: Alignment.center,
//                   ),
//                   trailing: const Icon(
//                     Icons.expand_circle_down,
//                     color: ColorConstants.introPageTextColor,
//                   ),
//                 ),
//                 sideContainer: Container(
//                   color: const Color(0xFF57B5F9),
//                 ))),
//         _verticalSpace(),
//         Flexible(
//             flex: flex,
//             child: ReuseableRow(
//                 listTile: ListTile(
//                   title: Text(
//                     'Gender Equality',
//                     style: _textStyle(),
//                   ),
//                   leading: Image.asset(
//                     r'assets/images/selecteditem5.png',
//                     alignment: Alignment.center,
//                   ),
//                   tileColor: Colors.grey.withOpacity(0.2),
//                   trailing: const Icon(
//                     Icons.expand_circle_down,
//                     color: ColorConstants.introPageTextColor,
//                   ),
//                 ),
//                 sideContainer: Container(
//                   color: Colors.red,
//                 ))),
//       ],
//     );
//   }
