// ignore: file_names
import 'dart:async';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/common/widgets/resuable_row_chosed.dart';
import 'package:savvy/models/sdgs_models/update_sdgs_list.dart';
import 'package:savvy/screens/dialouges/detail_dialog.dart';
import 'package:savvy/screens/dialouges/dialog_controller/detail_dialogs.dart';
import 'package:savvy/screens/dialouges/info_dialog.dart';
import 'package:savvy/screens/dialouges/not_found_sdg.dart';
import 'package:savvy/screens/post_page_view_screens/selected_screen.dart';
import 'package:savvy/services/api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/widgets/custom_button.dart';
import '../../controllers/screen_six_controller/selected_sds_list.dart';
import '../../utils/color_constants.dart';

class ChoosedGoalsScreen extends StatefulWidget {
  const ChoosedGoalsScreen({super.key});

  static const String screenName = '/ChoosedScreen';

  @override
  State<ChoosedGoalsScreen> createState() => _ChoosedGoalsScreenState();
}

class _ChoosedGoalsScreenState extends State<ChoosedGoalsScreen> {
  final sdgListController = Get.put(SdgsListController());
  late Size size;
  DetailDialog myDialog = DetailDialog();
  InfoDialog infoDialog = InfoDialog();
  late List<UpdatedSdgsList> list;
  DetailDialogs detailDialogs = DetailDialogs();

  String userName = '';

  @override
  void initState() {
    super.initState();
    list = sdgListController.selectedSds;
    getUserName();
    Timer(const Duration(microseconds: 500), () => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
        color: Colors.white,
        child: Scaffold(
          body: _buildBody(),
        ));
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
              flex: 1,
              child: Text(
                'Nice work, $userName ',
                style: tileHeadingStyle(),
              )),
          Flexible(
              flex: 1,
              child: Text(
                overflow: TextOverflow.clip,
                maxLines: 2,
                textAlign: TextAlign.center,
                'We have chosen 5 investment funds that align with the goals you have chosen.',
                style: tileDescriptionStyle(),
              )),
          Flexible(
              flex: 8,
              child: SizedBox(
                height: size.height * 0.7,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: _itemBuilder,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: size.height * 0.006,
                    );
                  },
                ),
              )),
          Flexible(flex: 1, child: _actionButtons(size, context)),
        ],
      ),
    );
  }

  Widget _actionButtons(Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: SizedBox(
              child: MyButton(
                  ontap: () {
                    Navigator.pop(context);
                  },
                  radius: size.height * 0.04,
                  color: ColorConstants.introPageTextColor,
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  spreadRadius: 2,
                  child: Text(
                    'BACK',
                    style: TextStyle(
                        color: Colors.white, fontSize: size.height * 0.020),
                  )),
            ),
          ),
          Flexible(
            child: SizedBox(
              child: MyButton(
                  ontap: () {
                    Navigator.pushNamed(context, SelectedScreen.screenName);
                  },
                  radius: size.height * 0.04,
                  color: ColorConstants.buttonColor,
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  spreadRadius: 2,
                  child: Text(
                    'NEXT',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: size.height * 0.020),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  tileHeadingStyle() {
    return GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: size.height * 0.020,
        color: ColorConstants.introPageTextColor);
  }

  tileDescriptionStyle() {
    return GoogleFonts.poppins(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.020);
  }

  Widget _itemBuilder(BuildContext context, int index) {
    // DetailDialogs detailDialogs = DetailDialogs();
    return SizedBox(
      height: size.height * 0.12,
      child: ChoosedRow(
          ontap: () {
            if (list[index].systemSdgsId == '1') {
              showDialog(
                context: context,
                builder: (context) {
                  return DetailDialog().detailDialog(size, context);
                },
              );
            } else if (list[index].systemSdgsId == '2') {
              showDialog(
                context: context,
                builder: (context) {
                  return detailDialogs.goal2dialog();
                },
              );
            } else if (list[index].systemSdgsId == '3') {
              showDialog(
                context: context,
                builder: (context) {
                  return detailDialogs.goal3Dialog();
                },
              );
            } else if (list[index].systemSdgsId == '4') {
              showDialog(
                context: context,
                builder: (context) {
                  return detailDialogs.goal4Dialog();
                },
              );
            } else if (list[index].systemSdgsId == '5') {
              showDialog(
                context: context,
                builder: (context) {
                  return detailDialogs.goal5Dialog();
                },
              );
            } else if (list[index].systemSdgsId == '6') {
              showDialog(
                context: context,
                builder: (context) {
                  return detailDialogs.goal6Dialog();
                },
              );
            } else if (list[index].systemSdgsId == '7') {
              showDialog(
                context: context,
                builder: (context) => detailDialogs.goal7Dialog(),
              );
            } else if (list[index].systemSdgsId == '11') {
              showDialog(
                context: context,
                builder: (context) {
                  return detailDialogs.goal11Dialog();
                },
              );
            } else if (list[index].systemSdgsId == '12') {
              showDialog(
                context: context,
                builder: (context) {
                  return detailDialogs.goal12Dialog();
                },
              );
            } else if (list[index].systemSdgsId == '13') {
              showDialog(
                context: context,
                builder: (context) {
                  return detailDialogs.goal13Dialog();
                },
              );
            } else if (list[index].systemSdgsId == '14') {
              showDialog(
                context: context,
                builder: (context) {
                  return detailDialogs.goal14Dialog();
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return const SdgDialog();
                },
              );
            }
          },
          title: "${list[index].systemSdgsId}. ${list[index].title}",
          subtitle: list[index].description == null? "no description": list[index].description.toString(),
          leading: Image.network(ApiUrls.baseUrl + list[index].image!)),
    );
  }

  void getUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userNamee = pref.getString('UserName').toString();
    debugPrint("introPage UserName  $userNamee");
    userName = userNamee;
  }
}


   // Flexible(
          //     flex: 1,
          //     child: ChoosedRow(
          //         ontap: () {
          //           showDialog(
          //             context: context,
          //             builder: (context) {
          //               return DetailDialog().detailDialog(size, context);
          //             },
          //           );
          //         },
          //         title: '1. No Poverty',
          //         subtitle: 'Fund: UBS ETF Sustainable Development Bank Bond..',
          //         leading: Image.asset(r'assets/images/chosenpng.png'))),
          // Flexible(
          //     flex: 1,
          //     child: ChoosedRow(
          //         ontap: () {},
          //         title: '2. Zero Hunger',
          //         subtitle: 'Fund: UBS ETF Sustainable Development Bank Bond..',
          //         leading: Image.asset(r'assets/images/chosenpng2.png'))),
          // Flexible(
          //     flex: 1,
          //     child: ChoosedRow(
          //         title: '3. Good Health & Well-Being',
          //         subtitle: 'Fund: L&G Pharma Breakthrough UCITS ETF-USD',
          //         leading: Image.asset(r'assets/images/chosenpng3.png'))),
          // Flexible(
          //     flex: 1,
          //     child: ChoosedRow(
          //         title: '4. Quality Education',
          //         subtitle:
          //             'Fund: Rize Education Tech & Digital Learning UCITS..',
          //         leading: Image.asset(r'assets/images/chosenpng4.png'))),
          // Flexible(
          //     flex: 1,
          //     child: ChoosedRow(
          //         title: '5. Gender Equality',
          //         subtitle:
          //             'Fund: Lyxor Global Gender Equality (DR) UCITS ETF..',
          //         leading: Image.asset(r'assets/images/chosenpng5.png'))),