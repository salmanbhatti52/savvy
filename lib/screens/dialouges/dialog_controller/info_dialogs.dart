// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:savvy/screens/dialouges/dialog_controller/detail_dialogs.dart';

import '../../../utils/dialog_const.dart';
import '../detail_dialog.dart';
import '../reuseabel_info_dialog.dart';

class InfoDialogs {
  final DetailDialogs detailDialogs;
  InfoDialogs({
    required this.detailDialogs,
  });

  List<ReuseableDialog> getInfoDialogList(BuildContext context, Size size) {
    return [
      ReuseableDialog(
          onTapClose: () {
            Navigator.pop(context);
          },
          onButtonTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return DetailDialog().detailDialog(size, context);
              },
            );
          },
          bgColor: DialogConst.firstColor,
          goalNumber: '1',
          goalTitle: 'Goal 1',
          goalDescription: 'End poverty in all its forms everywhere.',
          goalDetail:
              'Today, 9.2% of the world survives on less than 1.90 a day, compared to nearly 36% in 1990.'),
      ReuseableDialog(
        onButtonTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return detailDialogs.goal2dialog();
            },
          );
        },
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.secondColor,
        goalDescription:
            'End hunger, achieve food security and improved nutrition and promote sustainable agriculture.',
        goalDetail:
            'In 2020, about 829 million people globally were undernourished, it represents 9.9% of the global population.',
        goalNumber: '2',
        goalTitle: 'Goal 2',
      ),
      ReuseableDialog(
        onButtonTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return detailDialogs.goal3Dialog();
            },
          );
        },
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.thirdColor,
        goalDescription:
            'Ensure healthy lives and promote well-being for all at all ages.',
        goalDetail:
            ''' Half of the world’s population lacks access to essential health services. 5.7 million people in low and middle-income countries die each year from poor quality healthcare, and 2.9 million people die from being unable to access care. ''',
        goalNumber: '3',
        goalTitle: 'Goal 3',
      ),
      ReuseableDialog(
        onButtonTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return detailDialogs.goal4Dialog();
            },
          );
        },
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.fourthColor,
        goalDescription: '''Ensure inclusive and equitable
quality education and promote
lifelong learning opportunities
for all.''',
        goalDetail:
            '''More than 72 million children of primary education age are not in school and 759 million adults are illiterate.''',
        goalNumber: '4',
        goalTitle: 'Goal 4',
      ),
      ReuseableDialog(
        onButtonTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return detailDialogs.goal5Dialog();
            },
          );
        },
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.fifthColor,
        goalDescription:
            'Achieve gender equality and empower all women and girls.',
        goalDetail:
            'Women globally earn around 37% less than men in similar roles.',
        goalNumber: '5',
        goalTitle: 'Goal 5',
      ),
      ReuseableDialog(
        onButtonTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return detailDialogs.goal6Dialog();
            },
          );
        },
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.sixthColor,
        goalDescription:
            'Ensure availability and sustainable management of water and sanitation for all.',
        goalDetail:
            '2 billion people lack access to safely managed drinking water at home. Of those, 1.2 billion people have basic drinking water service.',
        goalNumber: '6',
        goalTitle: 'Goal 6',
      ),
      ReuseableDialog(
        onButtonTap: () => showDialog(
          context: context,
          builder: (context) => detailDialogs.goal7Dialog(),
        ),
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.seventhColor,
        goalDescription: '''Ensure access to affordable,
reliable, sustainable and modern energy for all.''',
        goalDetail:
            'Nearly 789 million lacked access to electricity in 2018. Even more, 2.8 billion lack access to clean cooking fuels and technologies which contributes to respiratory illness and other diseases.',
        goalNumber: '7',
        goalTitle: 'Goal 7',
      ),
      ReuseableDialog(
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.eighthColor,
        goalDescription: '''Promote sustained, inclusive
and sustainable economic 
growth, full and productive 
employment and decent work
for all.''',
        goalDetail:
            'Globally, 61per cent of all workers were engaged in informal employment in 2016. Excluding the agricultural sector, 51per cent of all workers fell into this employment category.',
        goalNumber: '8',
        goalTitle: 'Goal 8',
      ),
      ReuseableDialog(
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.ninthColor,
        goalDescription: '''Build resilient infrastructure,
promote inclusive and 
sustainable industrialization 
and foster innovation.''',
        goalDetail:
            'Globally, 840 million people live more than 2 kilometers from all-weather roads, 1 billion people lack electricity, and 4 billion people lack Internet access.',
        goalNumber: '9',
        goalTitle: 'Goal 9',
      ),
      ReuseableDialog(
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.tenthColor,
        goalDescription: 'Reduce inequality within and among countries.',
        goalDetail:
            'The poorest 50% of the population own just 2% of total net wealth. The middle 40% of people own 22% of total net wealth,The richest 10% of people own 76% of total net wealth.',
        goalNumber: '10',
        goalTitle: 'Goal 10',
      ),
      ReuseableDialog(
        onButtonTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return detailDialogs.goal11Dialog();
            },
          );
        },
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.eleventhColor,
        goalDescription: '''Make cities and human 
settlements inclusive, safe,
resilient and sustainable.''',
        goalDetail:
            '828 million people live in slums today and most them are found in Eastern and South-Eastern Asia. ',
        goalNumber: '11',
        goalTitle: 'Goal 11',
      ),
      ReuseableDialog(
        onButtonTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return detailDialogs.goal12Dialog();
            },
          );
        },
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.twelthColor,
        goalDescription:
            'Ensure sustainable consumption and production patterns.',
        goalDetail:
            'Each year, an estimated 1/3 of all food produced ends up rotting in bins or spoiling due to poor transportation and harvesting practices.',
        goalNumber: '12',
        goalTitle: 'Goal 12',
      ),
      ReuseableDialog(
        onButtonTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return detailDialogs.goal13Dialog();
            },
          );
        },
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.thirtenColor,
        goalDescription:
            'Take urgent action to combat climate change and its impacts.',
        goalDetail:
            'Climate change could increase the risk of hunger and malnutrition by up to 20% by 2050.',
        goalNumber: '13',
        goalTitle: 'Goal 13',
      ),
      ReuseableDialog(
        onButtonTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return detailDialogs.goal14Dialog();
            },
          );
        },
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.fourtenthColor,
        goalDescription: '''Conserve and sustainability use
the oceans, seas and marine
resources for sustainable
development.''',
        goalDetail:
            'Over three billion people depend on marine and coastal biodiversity for their livelihoods.',
        goalNumber: '14',
        goalTitle: 'Goal 14',
      ),
      ReuseableDialog(
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.fifteenthColor,
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
      ),
      ReuseableDialog(
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.sixtenthColor,
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
      ),
      ReuseableDialog(
        onTapClose: () {
          Navigator.pop(context);
        },
        bgColor: DialogConst.seventeenthColor,
        goalDescription: '''Strengthen the means of 
implementation and revitalize
the Global Partnership for
Sustainable Development.''',
        goalDetail: '',
        goalNumber: '17',
        goalTitle: 'Goal 17',
      ),
    ];
  }
}
