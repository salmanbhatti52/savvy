// ignore: file_names
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/common/widgets/resuable_row_chosed.dart';
import 'package:savvy/screens/dialouges/detail_dialog.dart';
import 'package:savvy/screens/dialouges/info_dialog.dart';
import 'package:savvy/screens/post_page_view_screens/selected_screen.dart';

import '../../common/widgets/custom_button.dart';
import '../../utils/color_constants.dart';

class ChoosedGoalsScreen extends StatefulWidget {
  const ChoosedGoalsScreen({super.key});

  @override
  State<ChoosedGoalsScreen> createState() => _ChoosedGoalsScreenState();
}

class _ChoosedGoalsScreenState extends State<ChoosedGoalsScreen> {
  late Size size;
  DetailDialog myDialog = DetailDialog();
  InfoDialog infoDialog = InfoDialog();
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
                'Nice work, Ellen. ',
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
              flex: 1,
              child: ChoosedRow(
                  ontap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return infoDialog.infoDialog(size, context);
                      },
                    );
                  },
                  title: '1. No Poverty',
                  subtitle: 'Fund: UBS ETF Sustainable Development Bank Bond..',
                  leading: Image.asset(r'assets/images/chosenpng.png'))),
          Flexible(
              flex: 1,
              child: ChoosedRow(
                  ontap: () {},
                  title: '2. Zero Hunger',
                  subtitle: 'Fund: UBS ETF Sustainable Development Bank Bond..',
                  leading: Image.asset(r'assets/images/chosenpng2.png'))),
          Flexible(
              flex: 1,
              child: ChoosedRow(
                  title: '3. Good Health & Well-Being',
                  subtitle: 'Fund: L&G Pharma Breakthrough UCITS ETF-USD',
                  leading: Image.asset(r'assets/images/chosenpng3.png'))),
          Flexible(
              flex: 1,
              child: ChoosedRow(
                  title: '4. Quality Education',
                  subtitle:
                      'Fund: Rize Education Tech & Digital Learning UCITS..',
                  leading: Image.asset(r'assets/images/chosenpng4.png'))),
          Flexible(
              flex: 1,
              child: ChoosedRow(
                  title: '5. Gender Equality',
                  subtitle:
                      'Fund: Lyxor Global Gender Equality (DR) UCITS ETF..',
                  leading: Image.asset(r'assets/images/chosenpng5.png'))),
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
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SelectedScreen();
                      },
                    ));
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
        fontSize: size.height * 0.025);
  }
}
