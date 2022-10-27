import 'package:flutter/material.dart';
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
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Savvy',
          style: GoogleFonts.abel(
              fontSize: size.height * 0.050,
              color: ColorConstants.introPageTextColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: selectScreenBody(),
    );
  }

  Widget selectScreenBody() {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Flexible(flex: 1, child: textDescription()),
      Flexible(flex: 4, child: pieChart()),
      Flexible(flex: 5, child: selectedList()),
      Flexible(flex: 2, child: acitionButton()),
    ]);
  }

  Widget pieChart() {
    return PieChart(
      animationDuration: const Duration(seconds: 1),
      colorList: const [
        Color(0xFFDCF0E5),
        Color(0xFFC9BAF2),
        Color(0xFF016654),
        Color(0xFF202445),
        Color(0xFF02E0A3),
      ],
      chartValuesOptions: const ChartValuesOptions(
        chartValueBackgroundColor: Colors.green,
        showChartValuesOutside: false,
        showChartValueBackground: false,
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
      ringStrokeWidth: size.height * 0.08,
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
          style: GoogleFonts.raleway(
              fontSize: size.height * 0.025, fontWeight: FontWeight.bold),
        ));
  }

  Widget textDescription() {
    return Text(
      textAlign: TextAlign.center,
      // maxLines: 2,
      'Savvy suggests you follow the below breakdown:',
      style: TextStyle(
        color: Colors.black,
        fontSize: size.height * 0.020,
      ),
    );
  }

  Widget selectedList() {
    var flex = 1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: flex,
          child: ReuseableRow(
              listTile: ListTile(
                title: const Text(
                  'No Poverty',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorConstants.introPageTextColor,
                  ),
                ),
                tileColor: Colors.grey.withOpacity(0.2),
                leading: Image.asset(
                  r'assets/images/selecteditemm.png',
                  alignment: Alignment.center,
                ),
                trailing: const Icon(
                  Icons.expand_circle_down,
                  color: ColorConstants.introPageTextColor,
                ),
              ),
              sideContainer: Container(
                color: ColorConstants.buttonColorLight,
              )),
        ),
        _verticalSpace(),
        Flexible(
            flex: flex,
            child: ReuseableRow(
                listTile: ListTile(
                  title: const Text(
                    'Zero Hunger',
                    style: TextStyle(
                        color: ColorConstants.introPageTextColor, fontSize: 20),
                  ),
                  leading: Image.asset(
                    r'assets/images/selecteditem2.png',
                    alignment: Alignment.center,
                  ),
                  trailing: const Icon(
                    Icons.expand_circle_down,
                    color: ColorConstants.introPageTextColor,
                  ),
                ),
                sideContainer: Container(
                  color: Colors.purple,
                ))),
        _verticalSpace(),
        Flexible(
            flex: flex,
            child: ReuseableRow(
                listTile: ListTile(
                  title: const Text(
                    'Health & Well-Being',
                    style: TextStyle(
                        color: ColorConstants.introPageTextColor, fontSize: 20),
                  ),
                  leading: Image.asset(
                    r'assets/images/selecteditem3.png',
                    alignment: Alignment.center,
                  ),
                  tileColor: Colors.grey.withOpacity(0.2),
                  trailing: const Icon(
                    Icons.expand_circle_down,
                    color: ColorConstants.introPageTextColor,
                  ),
                ),
                sideContainer: Container(
                  color: const Color(0xFFFDC842),
                ))),
        _verticalSpace(),
        Flexible(
            flex: flex,
            child: ReuseableRow(
                listTile: ListTile(
                  title: const Text(
                    'Quality Education',
                    style: TextStyle(
                        color: ColorConstants.introPageTextColor, fontSize: 20),
                  ),
                  leading: Image.asset(
                    r'assets/images/selecteditem4.png',
                    alignment: Alignment.center,
                  ),
                  trailing: const Icon(
                    Icons.expand_circle_down,
                    color: ColorConstants.introPageTextColor,
                  ),
                ),
                sideContainer: Container(
                  color: const Color(0xFF57B5F9),
                ))),
        _verticalSpace(),
        Flexible(
            flex: flex,
            child: ReuseableRow(
                listTile: ListTile(
                  title: const Text(
                    'Gender Equality',
                    style: TextStyle(
                        color: ColorConstants.introPageTextColor, fontSize: 20),
                  ),
                  leading: Image.asset(
                    r'assets/images/selecteditem5.png',
                    alignment: Alignment.center,
                  ),
                  tileColor: Colors.grey.withOpacity(0.2),
                  trailing: const Icon(
                    Icons.expand_circle_down,
                    color: ColorConstants.introPageTextColor,
                  ),
                ),
                sideContainer: Container(
                  color: Colors.red,
                ))),
      ],
    );
  }

  Widget _verticalSpace() {
    return SizedBox(
      height: size.height * 0.009,
    );
  }
}
