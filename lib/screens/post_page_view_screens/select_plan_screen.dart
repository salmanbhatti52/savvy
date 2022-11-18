import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:savvy/controllers/screen_six_controller/selected_sds_list.dart';
import 'package:savvy/models/invesment_model.dart';
import 'package:savvy/screens/blogscreens/blog_screen_one.dart';
import 'package:savvy/screens/login_page.dart';
import 'package:savvy/screens/post_page_view_screens/portfolio_screen.dart';
import 'package:savvy/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/color_constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SelectPlanScreen extends StatefulWidget {
  const SelectPlanScreen({super.key});
  static const String screenName = '/SelectPlanScreen';

  @override
  State<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  late Size size;
  double initialInvestment = 0.0;
  double permonthInvestment = 0.0;
  int yearsPlan = 0;
  List<Years> planList = [];
  List<String> otherItems = [];
  final ApiServices _apiServices = ApiServices();
  Color sytemUiOverlayColor = Colors.white;
  final controller = Get.find<SdgsListController>();

  List<String> years = [
    '1 Year',
    '2 Years',
    '3 Years',
    '4 Years',
    '5 years',
    '6 years',
    '7 years',
    '8 years',
    '9 years',
    '10 years',
    '11 years',
    '12 years',
    '13 years',
    '14 years',
    '15 years',
  ];
  String? selectedYear;
  int dropDownIndex = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      drawerEnableOpenDragGesture: false,
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
      endDrawer: myEndDrawer(),
      appBar: _buildAppBar(),
      body: selectedPlanBody(),
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

  Widget selectedPlanBody() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 10,
            child: seekBarContainer(),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Flexible(
            flex: 1,
            child: Text(
              'your potential planet impact',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                color: ColorConstants.introPageTextColor,
                fontSize: size.height * 0.02,
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.4,
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: planList.isEmpty
                        ? Image.asset(r'assets/images/earth.png',
                            fit: BoxFit.fill)
                        : pageSlider(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pageSlider() {
    List<String> title = [
      'C02 Emissions Avoided' '  ,KG',
      'Waste Avoided' ' ,KG',
      'Renewable Energy Generated' '  ,MW',
    ];
    List<String> svgsPath = [
      (r'assets/svgs/planpagsvg.svg'),
      (r'assets/svgs/planpgsvg3.svg'),
      (r'assets/svgs/planpgsvg2.svg'),
    ];

    List<String> value = [
      planList[dropDownIndex].co2,
      planList[dropDownIndex].waste,
      planList[dropDownIndex].electricity,
    ];

    return ListView.builder(
      itemCount: title.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.hardEdge,
          //  elevation: 2,
          child: Container(
            height: size.height * 0.3,
            width: size.width * 0.5,
            color: const Color(0xFFF6F6FE),
            child: Stack(
              children: [
                Positioned(
                  top: size.height * 0.005,
                  left: size.width * 0.015,
                  right: size.width * 0.070,
                  child: Text(
                    title[index],
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.visible,
                    style: myTextStyle(),
                  ),
                ),
                Positioned(
                  top: size.height * 0.070,
                  left: size.width * 0.015,
                  right: size.width * 0.070,
                  child: Text(
                    value[index],
                    style: _textStylee(),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                        height: size.height * 0.2,
                        width: size.width * 0.3,
                        child: SvgPicture.asset(
                          svgsPath[index],
                          fit: BoxFit.fill,
                        )))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget seekBarContainer() {
    // int years = 10;
    //int yearssPlan = yearsPlan.toInt();
    int initialInvestmentt = initialInvestment.toInt();
    int permonthInvestmentt = permonthInvestment.toInt();
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: Container(
            width: size.width * 0.9,
            decoration: myBoxDecorationn(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // RichText(
                  //         text: TextSpan(
                  //             style: GoogleFonts.poppins(
                  //                 color: Colors.black,
                  //                 fontSize: size.height * 0.020),
                  //             children: [
                  //           const TextSpan(text: 'Your investments after '),
                  //           TextSpan(
                  //               text: ' Years',
                  //               style: GoogleFonts.poppins(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: size.height * 0.020,
                  //                 color: Colors.black,
                  //               )),
                  //         ]))

                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text(
                            'Your investments after',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: size.height * 0.020),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          flex: 1,
                          child: _dropDownButton(),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.0090,
                  ),
                  Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              flex: 1,
                              child: SizedBox(
                                height: size.height * 0.070,
                                width: size.width * 0.14,
                                child: SvgPicture.asset(
                                  r'assets/svgs/poundsvg.svg',
                                  fit: BoxFit.fitHeight,
                                ),
                              )),
                          Flexible(
                            flex: 2,
                            child: planList.isEmpty
                                ? const Text('Please Select Year')
                                : Text(
                                    planList[dropDownIndex].withSavvy,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lato(
                                      fontSize: size.height * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                          ),
                          SizedBox(
                            width: size.width * 0.007,
                          ),
                          Flexible(
                            child: IconButton(
                              onPressed: () {
                                infoDialog();
                              },
                              icon: Icon(
                                Icons.info,
                                color: ColorConstants.introPageTextColor,
                                size: size.height * 0.015,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Flexible(
            flex: 8,
            child: Container(
              decoration: myBoxDecoration(),
              width: size.width * 0.9,
              child: SizedBox(
                width: size.width * 0.5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          'YOUR 1ST PAYMENT',
                          style: myTextStyle(),
                        ),
                      ),
                      Flexible(flex: 1, child: mySlider()),
                      Flexible(
                        flex: 1,
                        child: Text(
                          '€' '$initialInvestmentt',
                          style: myTextStyle(),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Flexible(
                              //  flex: 2,
                              child: SizedBox(
                                width: 5,
                              ),
                            ),
                            Flexible(
                              flex: 10,
                              child: Text(
                                'YOUR MONTHLY PAYMENTS',
                                style: myTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(flex: 1, child: mySliderTwo()),
                      Flexible(
                        flex: 1,
                        child: Text(
                          '€' '$permonthInvestmentt',
                          style: myTextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }

  planValue(http.Response response) {
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Investment investment = Investment.fromMap(data);
      planList = investment.data.toList();
      setState(() {});
    }
  }

  Widget mySlider() {
    return Slider.adaptive(
        onChangeEnd: (value) async {
          if (yearsPlan > 0 && initialInvestment >= 0) {
            if (permonthInvestment >= 0) {
              http.Response response = await _apiServices.calculatePlan(
                  yearsPlan.toString(), initialInvestment, permonthInvestment);

              planValue(response);
            } else {
              Fluttertoast.showToast(
                msg: 'Select Values',
              );
            }
          } else {
            Fluttertoast.showToast(
              msg: 'Please Select Years',
            );
            setState(() {
              permonthInvestment = 0;
              initialInvestment = 0;
              yearsPlan = 0;
              planList = [];
              otherItems = [];
            });
          }
        },
        label: '$initialInvestment',
        inactiveColor: Colors.grey,
        activeColor: ColorConstants.buttonColorLight,
        thumbColor: ColorConstants.buttonColorLight,
        min: 0.0,
        max: 5000.0,
        value: initialInvestment,
        divisions: 200,
        onChanged: (value) {
          setState(() {
            initialInvestment = value;
          });
        });
  }

  Widget mySliderTwo() {
    return Slider.adaptive(
      label: '''$permonthInvestment''',
      inactiveColor: Colors.grey,
      activeColor: ColorConstants.buttonColorLight,
      thumbColor: ColorConstants.buttonColorLight,
      min: 0.0,
      max: 100000,
      value: permonthInvestment,
      divisions: 50,
      onChanged: (value) {
        setState(() {
          permonthInvestment = value;
        });
      },
      onChangeEnd: (value) async {
        if (yearsPlan > 0 && initialInvestment >= 0) {
          if (permonthInvestment >= 0) {
            http.Response response = await _apiServices.calculatePlan(
                yearsPlan.toString(), initialInvestment, permonthInvestment);

            planValue(response);
          } else {
            Fluttertoast.showToast(
              msg: 'Select Values',
            );
          }
        } else {
          Fluttertoast.showToast(
            msg: 'Please Select Years',
          );
          setState(() {
            permonthInvestment = 0;
            initialInvestment = 0;
            yearsPlan = 0;
            planList = [];
            otherItems = [];
          });
        }
      },
    );
  }

  myTextStyle() {
    return GoogleFonts.poppins(
      color: ColorConstants.introPageTextColor,
      fontSize: size.height * 0.020,
    );
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

  myBoxDecoration() {
    return BoxDecoration(
      color: Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
    );
  }

  myBoxDecorationn() {
    return BoxDecoration(
      color: Colors.teal.shade100,
      borderRadius: BorderRadius.circular(10),
    );
  }

  _textStylee() {
    return GoogleFonts.poppins(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.030,
        fontWeight: FontWeight.bold);
  }

  Widget _dropDownButton() {
    return DropdownButton2(
      dropdownMaxHeight: size.height * 0.3,
      isExpanded: true,
      dropdownWidth: size.width * 0.3,
      dropdownDecoration: const BoxDecoration(color: Colors.white),
      dropdownElevation: 2,
      items: years
          .map((year) => DropdownMenuItem<String>(
                value: year,
                child: Text(
                  year.toString(),
                  style: GoogleFonts.abel(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  //overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      value: selectedYear,
      onChanged: (value) {
        setState(() async {
          selectedYear = value as String;
          yearsPlan = years.indexOf(value).toInt() + 1;

          //  print(yearsPlan.toString());
          dropDownIndex = years.indexOf(value);
          http.Response response = await _apiServices.calculatePlan(
              yearsPlan.toString(), initialInvestment, permonthInvestment);
          planValue(response);
          otherItems.add(planList[dropDownIndex].co2);
          otherItems.add(planList[dropDownIndex].waste);
          otherItems.add(planList[dropDownIndex].electricity);
        });
        // print(years.indexOf(value.toString()));
      },
      buttonDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.transparent)),
      buttonWidth: 100,
      buttonHeight: 50,
      iconDisabledColor: Colors.teal,
      iconEnabledColor: Colors.teal,
      buttonPadding: const EdgeInsets.all(5),
      underline: Container(
        color: Colors.transparent,
      ),
    );
  }

  infoDialog() {
    Alert(
      context: context,
      closeIcon: const Icon(
        Icons.close,
        color: Colors.white,
      ),
      style: AlertStyle(
          overlayColor: Colors.transparent,
          constraints: BoxConstraints.tight(size),
          backgroundColor: ColorConstants.introPageTextColor,
          isButtonVisible: false,
          descTextAlign: TextAlign.justify,
          alertAlignment: const Alignment(-1, -0.50),
          descStyle: GoogleFonts.lato(
              color: Colors.white, fontSize: size.height * 0.015)),
      // closeIcon: const Icon(Icons.close),

      desc:
          'All Investments involve a degree of risk.The value of an investment may go down as well as up and you may not get back the money you invested.it should not be assumed that the value of investments always rises.',
    ).show();
  }
}
