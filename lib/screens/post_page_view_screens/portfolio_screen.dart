import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:savvy/screens/post_page_view_screens/select_plan_screen.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import '../../common/widgets/custom_button.dart';
import '../../utils/color_constants.dart';

class PortFolioScreen extends StatefulWidget {
  const PortFolioScreen({super.key});

  @override
  State<PortFolioScreen> createState() => _PortFolioScreenState();
}

class _PortFolioScreenState extends State<PortFolioScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: _portfolioBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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

  _portfolioBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(flex: 3, child: textDescription()),
        Flexible(flex: 7, child: pieChart()),
        Flexible(flex: 1, child: selectedList()),
        Flexible(flex: 3, child: acitionButton()),
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
          'Reselect SDG’s',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: size.height * 0.025,
          ),
        ));
  }

  Widget pieChart() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Material(
          // clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(size.height * 0.16),
          elevation: 5,
          child: Container(
            //     clipBehavior: Clip.hardEdge,
            height: size.height * 0.46,
            width: size.width * 0.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.16),
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
          },
          chartRadius: size.height * 0.20,
          chartType: ChartType.ring,
          ringStrokeWidth: size.height * 0.085,
          centerText: 'Savvy',
          centerTextStyle: GoogleFonts.lato(
              color: const Color(0xFF325698),
              fontWeight: FontWeight.w700,
              fontSize: size.height * 0.028),
        ),
      ],
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

  selectedList() {
    return SingleChildScrollView(
      child: SizedBox(
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  width: 6,
                  height: 100,
                )),
            Flexible(
              flex: 60,
              child: ExpansionTileCard(
                title: const Text('No Poverty'),
                leading: SizedBox(
                    height: 150,
                    width: 45,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child:
                            Image.asset(r'assets/images/selecteditem2.png'))),
                children: [
                  Container(
                    height: 50,
                    width: size.width,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _title() {
//   return Container(
//     color: Colors.transparent,
//     child: Row(
//       children: [
//         Flexible(
//             flex: 4,
//             child: Container(
//               //  color: Colors.orange,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Flexible(
//                       child: SizedBox(
//                           height: 27,
//                           width: 60,
//                           child: SvgPicture.asset(
//                               'assets/svgs/appnamelandingpg.svg')))
//                 ],
//               ),
//             )),
//         Flexible(
//             flex: 3,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.read_more),
//                     SizedBox(
//                       height: size.height * 0.010,
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 )
//               ],
//             )),
//       ],
//     ),
//   );
// }