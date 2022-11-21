import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/utils/color_constants.dart';

class DetailDialog {
  String description =
      'A development bank is a supranational institution that has a positive social and economic impact, with a focus on emerging countries. Funds raised from the issuance of development bank bonds are usually used to support projects that are in line with the United Nations 2030 Agenda for Sustainable Development.These range from the development of core infrastructure to environmental protection. Since eradication of poverty is one of the most important SDGs, we believe that this ETF can help investors address this issue.';

  Widget detailDialog(Size size, BuildContext context) {
    var textFlex = 1;
    var containerFlex = 3;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: size.height * 0.7,
          child: Column(children: [
            Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Flexible(child: _title(context)),
                    Flexible(
                        child: Container(
                      alignment: Alignment.center,
                      height: size.height * 0.04,
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          color: ColorConstants.buttonColorLight,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'Info',
                        style: GoogleFonts.poppins(),
                      ),
                    )),
                  ],
                )),
            Flexible(
                flex: 14,
                child: Column(
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
                      child: Text(
                          'UBS - Sustainable Development Bank Bonds UCITS ETF'),
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
                        overflow: TextOverflow.clip,
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
                )),
          ]),
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '1. No Poverty',
                  style: GoogleFonts.lato(
                      color: const Color(0xFF1A1D48),
                      fontWeight: FontWeight.w700),
                )
              ],
            )),
        Flexible(
            flex: 3,
            child: InkWell(
              onTap: () {
                //  Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close))
                ],
              ),
            )),
      ],
    );
  }

  textStyle() {
    return GoogleFonts.lato(
        color: ColorConstants.introPageTextColor, fontWeight: FontWeight.w700);
  }

  textStyleTwo() {
    return GoogleFonts.lato(
        color: ColorConstants.introPageTextColor, fontWeight: FontWeight.w700);
  }

  textStyleTwoo(Size size) {
    return GoogleFonts.lato(
        fontSize: size.height * 0.013,
        //   color: ColorConstants.introPageTextColor,
        fontWeight: FontWeight.w700);
  }

  verticalSpace(Size size) {
    return SizedBox(
      height: size.height * 0.014,
    );
  }

  myBoxDecorationn() {
    return BoxDecoration(
      color: const Color(0xFF58E5AA).withOpacity(0.6),
      borderRadius: BorderRadius.circular(10),
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
            '-10.33%',
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
            '-2.04%',
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
            '-9.56%',
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
}
