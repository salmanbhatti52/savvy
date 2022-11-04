import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/screens/dialouges/info_dialog.dart';
import 'package:savvy/screens/dialouges/reuseabel_info_dialog.dart';
import 'package:savvy/screens/post_page_view_screens/chosed_goals_Screen.dart';

import '../../common/widgets/custom_button.dart';
import '../../utils/color_constants.dart';
import '../../utils/dialog_const.dart';
import '../post_page_view_screens/selected_screen.dart';

class PageViewScreenSix extends StatefulWidget {
  const PageViewScreenSix({super.key});

  @override
  State<PageViewScreenSix> createState() => _PageViewScreenSixState();
}

class _PageViewScreenSixState extends State<PageViewScreenSix> {
  int itemsAdded = 0;
  bool isNotUndo = true;
  InfoDialog infoDialog = InfoDialog();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 2,
                child: headingText(size),
              ),
              SizedBox(
                height: size.height * 0.009,
              ),
              Flexible(
                flex: 15,
                child: Column(
                  children: [
                    Expanded(
                      flex: 14,
                      child: imageColunm(size, context),
                    ),
                    Expanded(flex: 2, child: actionButtons(size, context)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionButtons(Size size, BuildContext context) {
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

  headingText(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            'Click on the cards below to read through the Sustainable development goals. Then drop your\ntop 5 goals into the basket below!',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: size.height * 0.017),
          ),
        ),
      ],
    );
  }

  Widget imageColunm(Size size, BuildContext context) {
    var space = size.height * 0.009;
    var elevation = 1.0;

    return Column(
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const ReuseableDialog(
                                bgColor: DilogConst.firstColor,
                                goalNumber: '1',
                                goalTitle: 'Goal 1',
                                goalDescription:
                                    'End poverty in all its forms everywhere.',
                                goalDetail:
                                    'Today, 9.2% of the world survives on less than 1.90 a day, compared to nearly 36% in 1990.');
                          },
                        );
                      },
                      child: Card(
                          elevation: elevation,
                          child:
                              Image.asset(r'assets/images/pgsixcompnent1.png'))

                      // :
                      )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.secondColor,
                        goalDescription:
                            'End hunger, achieve food security and improved nutrition and promote sustainable agriculture.',
                        goalDetail:
                            'In 2020, about 829 million people globally were undernourished, it represents 9.9% of the global population.',
                        goalNumber: '2',
                        goalTitle: 'Goal 2',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgsixcompnent2.png')),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.thirdColor,
                        goalDescription:
                            'Ensure healthy lives and promote well-being for all at all ages.',
                        goalDetail:
                            ''' Half of the world’s population lacks access to essential health services. 5.7 million people in low and middle-income countries die each year from poor quality healthcare, and 2.9 million people die from being unable to access care. ''',
                        goalNumber: '3',
                        goalTitle: 'Goal 3',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgsixcompnent3.png')),
              )),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.fourthColor,
                        goalDescription: '''Ensure inclusive and equitable
quality education and promote
lifelong learning opportunities
for all.''',
                        goalDetail:
                            '''More than 72 million children of primary education age are not in school and 759 million adults are illiterate.''',
                        goalNumber: '4',
                        goalTitle: 'Goal 4',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgsixcompnent4.png')),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.fifthColor,
                        goalDescription:
                            'Achieve gender equality and empower all women and girls.',
                        goalDetail:
                            'Women globally earn around 37% less than men in similar roles.',
                        goalNumber: '5',
                        goalTitle: 'Goal 5',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgsixcompnent5.png')),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.sixthColor,
                        goalDescription:
                            'Ensure availability and sustainable management of water and sanitation for all.',
                        goalDetail:
                            '2 billion people lack access to safely managed drinking water at home. Of those, 1.2 billion people have basic drinking water service.',
                        goalNumber: '6',
                        goalTitle: 'Goal 6',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgsixcompnent6.png')),
              )),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.seventhColor,
                        goalDescription: '''Ensure access to affordable,
reliable, sustainable and modern energy for all.''',
                        goalDetail:
                            'Nearly 789 million lacked access to electricity in 2018. Even more, 2.8 billion lack access to clean cooking fuels and technologies which contributes to respiratory illness and other diseases.',
                        goalNumber: '7',
                        goalTitle: 'Goal 7',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgcomponent7.png')),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.eighthColor,
                        goalDescription: '''Promote sustained, inclusive
and sustainable economic 
growth, full and productive 
employment and decent work
for all.''',
                        goalDetail:
                            'Globally, 61per cent of all workers were engaged in informal employment in 2016. Excluding the agricultural sector, 51per cent of all workers fell into this employment category.',
                        goalNumber: '8',
                        goalTitle: 'Goal 8',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgcomponent8.png')),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.ninthColor,
                        goalDescription: '''Build resilient infrastructure,
promote inclusive and 
sustainable industrialization 
and foster innovation.''',
                        goalDetail:
                            'Globally, 840 million people live more than 2 kilometers from all-weather roads, 1 billion people lack electricity, and 4 billion people lack Internet access.',
                        goalNumber: '9',
                        goalTitle: 'Goal 9',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgcomponent9.png')),
              )),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.tenthColor,
                        goalDescription:
                            'Reduce inequality within and among countries.',
                        goalDetail:
                            'The poorest 50% of the population own just 2% of total net wealth. The middle 40% of people own 22% of total net wealth,The richest 10% of people own 76% of total net wealth.',
                        goalNumber: '10',
                        goalTitle: 'Goal 10',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgcomponent10.png')),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.eleventhColor,
                        goalDescription: '''Make cities and human 
settlements inclusive, safe,
resilient and sustainable.''',
                        goalDetail:
                            '828 million people live in slums today and most them are found in Eastern and South-Eastern Asia. ',
                        goalNumber: '11',
                        goalTitle: 'Goal 11',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgcomponent11.png')),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.twelthColor,
                        goalDescription:
                            'Ensure sustainable consumption and production patterns.',
                        goalDetail:
                            'Each year, an estimated 1/3 of all food produced ends up rotting in bins or spoiling due to poor transportation and harvesting practices.',
                        goalNumber: '12',
                        goalTitle: 'Goal 12',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgcomponent12.png')),
              )),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.thirtenColor,
                        goalDescription:
                            'Take urgent action to combat climate change and its impacts.',
                        goalDetail:
                            'Climate change could increase the risk of hunger and malnutrition by up to 20% by 2050.',
                        goalNumber: '13',
                        goalTitle: 'Goal 13',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgcomponent13.png')),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.fourtenthColor,
                        goalDescription: '''Conserve and sustainability use
the oceans, seas and marine
resources for sustainable
development.''',
                        goalDetail:
                            'Over three billion people depend on marine and coastal biodiversity for their livelihoods.',
                        goalNumber: '14',
                        goalTitle: 'Goal 14',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgcomponent14.png')),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.fifteenthColor,
                        goalDescription: '''Protect, restore and promote
sustainable use of terrestial
ecosystems, sustainably 
manage forests, combat
desertification, and halt and
reverse
land degradation and halt
biodiversity loss.''',
                        goalDetail:
                            'Of the 8,300 animal breeds known, 8 per cent are extinct and 22 per cent are at risk of extinction. ',
                        goalNumber: '15',
                        goalTitle: 'Goal 15',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgcomponent15.png')),
              )),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.sixtenthColor,
                        goalDescription: '''Promote peaceful and 
inclusive societies for 
sustainable development,
provide access to justice for 
all and build effective, 
accountable and inclusive
institutions at all levels.''',
                        goalDetail: '',
                        goalNumber: '16',
                        goalTitle: 'Goal 16',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgcomponent16.png')),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ReuseableDialog(
                        bgColor: DilogConst.seventhColor,
                        goalDescription: '''Strengthen the means of 
implementation and revitalize
the Global Partnership for
Sustainable Development.''',
                        goalDetail: '',
                        goalNumber: '17',
                        goalTitle: 'Goal 17',
                      );
                    },
                  );
                },
                child: Card(
                    elevation: elevation,
                    child: Image.asset(r'assets/images/pgcomponent17.png')),
              )),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const ChoosedGoalsScreen();
                    },
                  ));
                },
                child: Flexible(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(r'assets/images/pgviewbasket.png'),
                      // Container(
                      //   width: 20,
                      //   height: 20,
                      //   color: Colors.green,
                      //   child: Text(
                      //       textAlign: TextAlign.center, itemsAdded.toString()),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
