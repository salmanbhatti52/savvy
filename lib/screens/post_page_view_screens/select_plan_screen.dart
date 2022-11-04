import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:savvy/models/invesment_model.dart';
import 'package:savvy/screens/blogscreens/blog_screen_one.dart';
import 'package:savvy/screens/login_page.dart';
import 'package:savvy/screens/post_page_view_screens/selected_screen.dart';
import 'package:savvy/services/api_services.dart';

import '../../utils/color_constants.dart';

class SelectPlanScreen extends StatefulWidget {
  const SelectPlanScreen({super.key});

  @override
  State<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  late Size size;
  double initialInvestment = 0.0;
  double permonthInvestment = 0.0;
  double yearsPlan = 0;
  List<Investment> planList = [];

  final ApiServices _apiServices = ApiServices();
  String savvyValue = '';
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        endDrawer: myEndDrawer(),
        appBar: _buildAppBar(),
        body: selectedPlanBody(),
      ),
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

  Widget selectedPlanBody() {
    return Center(
      child: Column(
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
              'YOUR PLANET IMPACT',
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
              width: size.width * 0.7,
              height: size.height * 0.4,
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      child: Image.asset(
                    r'assets/images/earth.png',
                    fit: BoxFit.fill,
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget seekBarContainer() {
    // int years = 10;
    int yearssPlan = yearsPlan.toInt();
    return Column(
      children: [
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
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          '''Your Plan(Years)''',
                          style: myTextStyle(),
                        ),
                      ),
                      Flexible(flex: 1, child: yearSlider()),
                      Flexible(
                        flex: 1,
                        child: Text(
                          '$yearssPlan' ' Years',
                          style: myTextStyle(),
                        ),
                      ),
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
                          '€' '$initialInvestment',
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
                          '€' '$permonthInvestment',
                          style: myTextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        Flexible(
            flex: 3,
            child: SizedBox(
              width: size.width * 0.9,
              child: ListView.separated(
                itemCount: 15,
                scrollDirection: Axis.horizontal,
                itemBuilder: _itemBuilder,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            ))
      ],
    );
  }

  planValue(Response response) {
    // print('plan value body');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        savvyValue = data['data']['year_1']['with_savvy'];
      });
    }
  }

  Widget mySlider() {
    return Slider.adaptive(
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
      max: 5000.0,
      value: permonthInvestment,
      divisions: 200,
      onChanged: (value) {
        setState(() {
          permonthInvestment = value;
        });
      },
      onChangeEnd: (value) async {
        // print('onchanged Call');
        if (yearsPlan > 0 && initialInvestment > 0) {
          if (permonthInvestment > 0) {
            Response response = await _apiServices.calculatePlan(
                yearsPlan.toString(), initialInvestment, permonthInvestment);

            planValue(response);
          } else {
            Fluttertoast.showToast(
              msg: 'Select Values',
            );
          }
        } else {
          Fluttertoast.showToast(
            msg: 'Select Values',
          );
          setState(() {
            permonthInvestment = 0;
            initialInvestment = 0;
            yearsPlan = 0;
            savvyValue = '';
          });
        }
      },
    );
  }

  Widget yearSlider() {
    return Slider.adaptive(
      //    label: '$yearsPlan',
      inactiveColor: Colors.grey,
      activeColor: ColorConstants.buttonColorLight,
      thumbColor: ColorConstants.buttonColorLight,
      min: 0.0,
      max: 15.0,
      value: yearsPlan,
      divisions: 15,
      onChanged: (value) {
        setState(() {
          yearsPlan = value;
        });
      },
    );
    // onChangeEnd: (value) async {
    //   print('onchanged Call');
    //   Response response = await _apiServices.calculatePlan(
    //       '2', initialInvestment, permonthInvestment);
    //   print(response.statusCode);
    //   planValue(response);
    // },
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
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SelectedScreen();
                        },
                      ));
                    },
                    child: Text(
                      'PORTFOLIO',
                      style: _textStyle(),
                    ),
                  )),
                  Flexible(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const BlogScreen();
                        },
                      ));
                    },
                    child: Text(
                      'LEARN',
                      style: _textStyle(),
                    ),
                  )),
                  Flexible(
                      child: InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(context, LoginPage.screenName);
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
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  r'assets/images/drawerpng.png',
                  //   fit: BoxFit.fitWidth,
                ),
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

  Widget _itemBuilder(BuildContext context, int index) {
    var plan = yearsPlan.toInt();
    return Container(
      width: size.width * 0.8,
      decoration: myBoxDecorationn(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                flex: 2,
                child: RichText(
                    text: TextSpan(
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: size.height * 0.020),
                        children: [
                      const TextSpan(text: 'Your investments after '),
                      TextSpan(
                          text: '$plan' ' Years',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.020,
                            color: Colors.black,
                          )),
                    ]))),
            SizedBox(
              height: size.height * 0.0090,
            ),
            Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Text(
                        savvyValue,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontSize: size.height * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
// }
//  Flexible(
//             flex: 3,
//             child: Container(
//               width: size.width * 0.9,
//               decoration: myBoxDecorationn(),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                         flex: 2,
//                         child: RichText(
//                             text: TextSpan(
//                                 style: GoogleFonts.poppins(
//                                     color: Colors.black,
//                                     fontSize: size.height * 0.020),
//                                 children: [
//                               const TextSpan(text: 'Your investments after '),
//                               TextSpan(
//                                   text: '$yearssPlan' ' Years',
//                                   style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: size.height * 0.020,
//                                     color: Colors.black,
//                                   )),
//                             ]))),
//                     SizedBox(
//                       height: size.height * 0.0090,
//                     ),
//                     Flexible(
//                         flex: 2,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Flexible(
//                                 flex: 1,
//                                 child: SizedBox(
//                                   height: size.height * 0.070,
//                                   width: size.width * 0.14,
//                                   child: SvgPicture.asset(
//                                     r'assets/svgs/poundsvg.svg',
//                                     fit: BoxFit.fitHeight,
//                                   ),
//                                 )),
//                             Flexible(
//                               flex: 2,
//                               child: Text(
//                                 savvyValue,
//                                 softWrap: false,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: GoogleFonts.lato(
//                                   fontSize: size.height * 0.03,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                   ],
//                 ),
//               ),
//             )),

//  Container(
//               width: size.width * 0.9,
//               decoration: myBoxDecorationn(),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                         flex: 2,
//                         child: RichText(
//                             text: TextSpan(
//                                 style: GoogleFonts.poppins(
//                                     color: Colors.black,
//                                     fontSize: size.height * 0.020),
//                                 children: [
//                               const TextSpan(text: 'Your investments after '),
//                               TextSpan(
//                                   text: '$yearssPlan' ' Years',
//                                   style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: size.height * 0.020,
//                                     color: Colors.black,
//                                   )),
//                             ]))),
//                     SizedBox(
//                       height: size.height * 0.0090,
//                     ),
//                     Flexible(
//                         flex: 2,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Flexible(
//                                 flex: 1,
//                                 child: SizedBox(
//                                   height: size.height * 0.070,
//                                   width: size.width * 0.14,
//                                   child: SvgPicture.asset(
//                                     r'assets/svgs/poundsvg.svg',
//                                     fit: BoxFit.fitHeight,
//                                   ),
//                                 )),
//                             Flexible(
//                               flex: 2,
//                               child: Text(
//                                 savvyValue,
//                                 softWrap: false,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: GoogleFonts.lato(
//                                   fontSize: size.height * 0.03,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                   ],
//                 ),
//               ),
//             )
