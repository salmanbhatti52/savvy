import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../utils/color_constants.dart';

class TabDialog extends StatefulWidget {
  const TabDialog({super.key});

  @override
  State<TabDialog> createState() => _TabDialogState();
}

class _TabDialogState extends State<TabDialog>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 2,
          height: size.height * 0.7,
          child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 5,
                          child: Text(
                            textAlign: TextAlign.center,
                            '7. Affordable and Clean Energy',
                            style: GoogleFonts.lato(
                                color: const Color(0xFF1A1D48),
                                fontWeight: FontWeight.w700),
                          )),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Flexible(
                          flex: 2,
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.close)))
                    ],
                  )),
              SizedBox(
                height: size.height * 0.008,
              ),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.050,
                    width: size.width * 0.55,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      tabs: [
                        Text(
                          'Info',
                          style: GoogleFonts.poppins(
                              fontSize: size.height * 0.015,
                              color: const Color(0xFF1A1D48)),
                        ),
                        Text(
                          'Companies',
                          style: GoogleFonts.poppins(
                              fontSize: size.height * 0.015,
                              color: const Color(0xFF1A1D48)),
                        ),
                      ],
                      indicator: RectangularIndicator(
                        horizontalPadding: 3,
                        verticalPadding: 3,
                        bottomLeftRadius: 20,
                        topLeftRadius: 20,
                        bottomRightRadius: 20,
                        topRightRadius: 20,
                        color: const Color(0xFF58E5AA),
                      ),
                    ),
                  )
                ],
              )),
              Flexible(
                  flex: 14,
                  child: TabBarView(controller: _tabController, children: [
                    Container(
                      color: Colors.white,
                      child: _tabBarView(size),
                    ),
                    Column(
                      children: const [],
                    ),
                  ])),
            ],
          ),
        ),
      ),
    );
  }

  _tabBarView(Size size) {
    String description =
        'This fund provides exposure to publically traded companies that are actively engaged in the global clean energy industry. Companies included in the fund consist of those who supply key components, provide clean energy related services, manufacture original equipments and those who produce clean power.';

    var textFlex = 1;
    var containerFlex = 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: textFlex,
          child: Text(
            'Fund name',
            style: textStyleTwo(),
          ),
        ),
        //  verticalSpace(size),
        const Flexible(
          flex: 2,
          child: Text('L&G Clean Energy UCITS ETF '),
        ),
        //   verticalSpace(size),
        Flexible(
          flex: 2,
          child: Text(
            'Description',
            style: textStyleTwo(),
          ),
        ),
        //    verticalSpace(size),
        Flexible(
          flex: 4,
          child: Text(
            textAlign: TextAlign.justify,
            description,
            style: textStyleTwoo(size),
          ),
        ),
        //     verticalSpace(size),
        Flexible(
          flex: textFlex,
          child: Text(
            'Performance',
            style: textStyleTwo(),
          ),
        ),
        Flexible(flex: containerFlex, child: containerOne(size)),
        Flexible(flex: containerFlex, child: containerTwo(size)),
        Flexible(flex: containerFlex, child: containerThree(size)),
        Flexible(
          flex: textFlex,
          child: Text(
            'Documentation',
            style: textStyleTwo(),
          ),
        ),
        Flexible(
          flex: textFlex,
          child: Row(
            children: [
              Flexible(
                  child: Icon(
                Icons.ad_units,
                size: size.height * 0.015,
              )),
              const Flexible(child: Text('View factsheet')),
            ],
          ),
        ),
      ],
    );
  }

  containerOne(Size size) {
    return Container(
      width: size.width * 0.9,
      decoration: myBoxDecorationn(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Text(
            'This year so far',
            style: containerTextStyle(size),
          )),
          Flexible(
              child: Text(
            '-9.58%',
            style: containerText(size),
          )),
        ],
      ),
    );
  }

  containerTwo(Size size) {
    return Container(
      width: size.width * 0.9,
      decoration: myBoxDecorationn(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Text(
            'Returns in 2021',
            style: containerTextStyle(size),
          )),
          Flexible(
              child: Text(
            '1.45%',
            style: containerText(size),
          )),
        ],
      ),
    );
  }

  containerThree(Size size) {
    return Container(
      width: size.width * 0.9,
      decoration: myBoxDecorationn(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Text(
            'Annualised return over the past 3 years',
            style: containerTextStyle(size),
          )),
          Flexible(
              child: Text(
            'N/A',
            style: containerText(size),
          )),
        ],
      ),
    );
  }

  containerTextStyle(Size size) {
    return GoogleFonts.lato(fontSize: size.height * 0.014);
  }

  containerText(Size size) {
    return GoogleFonts.lato(
        fontSize: size.height * 0.020, fontWeight: FontWeight.w700);
  }

  textStyleTwo() {
    return GoogleFonts.lato(
        color: ColorConstants.introPageTextColor, fontWeight: FontWeight.w700);
  }

  textStyleTwoo(Size size) {
    return GoogleFonts.lato(
        fontSize: size.height * 0.010,
        //   color: ColorConstants.introPageTextColor,
        fontWeight: FontWeight.w700);
  }

  myBoxDecorationn() {
    return BoxDecoration(
      color: const Color(0xFF58E5AA),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
