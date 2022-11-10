import 'package:flutter/cupertino.dart';
import 'package:savvy/screens/dialouges/reuseable_detail_dialog.dart';
import 'package:savvy/screens/dialouges/reuseable_tab_dialog.dart';

class DetailDialogs {
  Widget goal2dialog() {
    String description =
        '''RIZF is invested in 45 companies that are innovating across the food value chain to build a more sustainable and equitable food system. Around 70% of their investments are focused on sustainable packaging (28.8%), Ingredients, Flavours and Fragrances (23.7%) and Plant based and Organic Foods (18.7%)
''';
    return ReuseableDetialDialog(
        description: description,
        dialogTitle: '2. Zero Hunger',
        fundNameDescrip: 'Rize Sustainable Future of Food UCITS ETF',
        thisYear: '-23.02%',
        returns: '11.26%',
        pastRetruns: 'N/A');
  }

  goal3Dialog() {
    String description =
        '''Basket of companies involved in health care such as equipment and supplies, provision of health care related services, including distribution of health care products, as well as owners and operators of health care facilities and organisations. The fund is designed to  remove companies involved in controversial, nuclear and conventional weapons, civilian firearms, tobacco, thermal coal, oil sands and companies that are classified as violating the United Nations Global Compact principles , as well as companies which have been involved in severe ESG related controversies.
''';
    return ReuseableDetialDialog(
        description: description,
        dialogTitle: '3. Good Health & Well-Being',
        fundNameDescrip: 'Rize Sustainable Future of Food UCITS ETF',
        thisYear: '-5.67%',
        returns: '4.12%',
        pastRetruns: '30.47%');
  }

  goal4Dialog() {
    String description =
        '''Technology has the potential to tackle major challenges faced by the education sector. From promoting accessibility and inclusion, to empowering institutions and teachers, digital learning technologies can help elevate the education sector into the 21st century. This fund seeks to invest in companies that potentially stand to benefit from the increased adoption of digital and lifelong learning technologies such as personalisation and adaptive learning, video content, gamification and immersion technology that are changing the way people learn.
''';
    return ReuseableDetialDialog(
        description: description,
        dialogTitle: '4. Quality Education',
        fundNameDescrip: '''Rize Education Tech and Digital Learning
UCITS ETF - C - USD''',
        thisYear: '-18.26%',
        returns: '-46.23%',
        pastRetruns: 'N/A');
  }

  goal5Dialog() {
    String description =
        '''This fund invests globally in companies that advance gender equality.  The strategy integrates sustainability criteria as part of the stock selection process and through a theme-specific sustainability assessment. The portfolio includes companies with higher gender scores based on an internally developed gender score methodology. This comprises various criteria, such as board diversity, equal renumeration, talent management and employee well-being. Companies that exhibit an inferior overall ESG performance are excluded from the investment universe.
''';
    return ReuseableDetialDialog(
        description: description,
        dialogTitle: '5. Gender Equality',
        fundNameDescrip: 'RobecoSAM Global Gender Equality Equities D EUR',
        thisYear: '-14.06%',
        returns: '31.66%',
        pastRetruns: '9.85%');
  }

  goal6Dialog() {
    String description =
        '''This Index aims to track the performance of a basket of stocks of 
companies that are actively engaged in the international clean water 
industry through the provision of technological, digital, engineering, 
utility and/or other services. ''';
    return ReuseableTabDialog(
        description: description,
        dialogTitle: '6. Clean Water and Sanitation',
        fundNameDescrip: 'L&G Clean Water UCITS ETF',
        thisYear: '-17.03%',
        returns: '36.96%',
        pastRetruns: '35.44%');
  }

  goal11Dialog() {
    String description =
        '''The iShares Smart City Infrastructure UCITS ETF is composed of companies from both developed and developing markets that provide services and solutions for sustainable development and efficient running of Smart City infrastructure, in a sustainable manner. ''';
    return ReuseableTabDialog(
        description: description,
        dialogTitle: '11. Sustainable Cities and Communities',
        fundNameDescrip:
            'iShares Smart City Infrastructure UCITS ETF Acc - USD',
        thisYear: '-19.01%',
        returns: '32.02%',
        pastRetruns: 'N/A');
  }

  goal12Dialog() {
    String description =
        '''This Fund invests in companies globally that benefit from, or
contribute to, the advancement of the “Circular Economy”. 
The Circular Economy concept recognises the importance of a
sustainable economic system and aims to minimise waste by 
considering the full life-cycle of materials, and redesigning products 
and operations to encourage greater re-use and recycling.



''';
    return ReuseableTabDialog(
        description: description,
        dialogTitle: '12. Responsible Consumption and Production',
        fundNameDescrip: 'BlackRock Circular Economy Fund D2 GBP Hedged ACC',
        thisYear: '-35.42%   ',
        returns: '17.9%',
        pastRetruns: 'N/A');
  }

  goal13Dialog() {
    String description =
        '''The fund is composed of European companies selected on the basis of
opportunities and risks associated with the low carbon transition. 
These companies aim to comply with the Paris Aligned Benchmark (PAB)
targets of reducing carbon intensity by at least 50% and achieving an
additional decarbonisation target of 7% each year. 
As a result, fossil-fuel activities are excluded from the fund.
 ''';
    return ReuseableTabDialog(
        description: description,
        dialogTitle: '13. Climate Action',
        fundNameDescrip: 'BNP PARIBAS EASY LOW CARBON 100 EUROPE PAB',
        thisYear: '-35.42%',
        returns: '17.9%',
        pastRetruns: '4.88%');
  }

  goal14Dialog() {
    String description =
        '''The fund is composed of companies that are best placed to seize the 
opportunities offered by the sustainable use of ocean resources 
(coastal protection, eco-tourism, recycling, human capital, corporate 
governance, etc.), while also having a positive Environmental, Social
and Governance (ESG) rating. 
 ''';
    return ReuseableTabDialog(
        description: description,
        dialogTitle: '14. Life Below Water',
        fundNameDescrip: 'BNP PARIBAS EASY ECPI GLOBAL ESG BLUE ECONOMY',
        thisYear: '-17.03%',
        returns: '36.96%',
        pastRetruns: '35.44%');
  }
}
