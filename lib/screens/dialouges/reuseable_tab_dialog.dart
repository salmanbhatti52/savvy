// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../utils/color_constants.dart';

class ReuseableTabDialog extends StatefulWidget {
  const ReuseableTabDialog({
    Key? key,
    required this.description,
    required this.dialogTitle,
    required this.fundNameDescrip,
    required this.thisYear,
    required this.returns,
    required this.pastRetruns,
  }) : super(key: key);
  final String description;
  final String dialogTitle;
  final String fundNameDescrip;
  final String thisYear;
  final String returns;

  final String pastRetruns;

  @override
  State<ReuseableTabDialog> createState() => _ReuseableTabDialogState();
}

class _ReuseableTabDialogState extends State<ReuseableTabDialog>
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
          width: double.infinity,
          height: size.height * 0.7,
          child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Flexible(flex: 1, child: SizedBox()),
                      Flexible(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                                flex: 9,
                                child: Text(
                                  widget.dialogTitle,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: const Color(0xFF1A1D48),
                                      fontWeight: FontWeight.w700),
                                )),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: size.width * 0.015,
                      // ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                                flex: 1,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(Icons.close)))
                          ],
                        ),
                      )
                    ],
                  )
                  
                  ),
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
        Flexible(
          flex: 2,
          child: Text(widget.fundNameDescrip),
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
            widget.description,
            textAlign: TextAlign.justify,
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
            widget.thisYear,
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
            widget.returns,
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
            widget.pastRetruns,
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
