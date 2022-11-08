import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:savvy/common/widgets/round_icon_button.dart';
import 'package:savvy/utils/color_constants.dart';

class BlogDetail extends StatefulWidget {
  const BlogDetail({super.key});

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  String readbolog =
      '''The health of the ocean is spiraling downwards far more rapidly than we had thought. We are seeing greater change, happening faster, and the effects are more imminent than previously anticipated.The two main drivers of these changes are the degradation of the water quality induced by human activity and the loss of marine biodiversity due to overfishing. The ocean is absorbing much of the human-induced warming as well as unprecedented levels of carbon dioxide. Before the industrial era, the ocean was actually a net source of CO2. However, the increasing atmospheric CO2 concentration, driven by man-made emissions, is forcing the ocean to now absorb this gas.  While the ability of the ocean to capture and store carbon has helped to slow the accumulation of atmospheric CO2 – and, hence, the pace of global warming – it has come at a cost. Increasing CO2 in the ocean alters the chemistry of seawater – an effect known as ocean acidification – which has negative impacts on marine life. Ocean acidification can affect these fisheries by changing the food web. Increasing ocean acidity also impairs the ability of shellfish, corals, and small marine creatures at the foundation of the ocean food web from building skeletons or shells. This has an impact on the whole food chain up to apex predators such as sharks or orcas. In terms of overfishing, is it important to be aware of the following facts:

In 2013 around 93 million tonnes of fish were caught world-wide 

About 38.5 million tonnes of bycatch results from current preferred fishing practices each year 

Over just 40 years there has been a decrease recorded in marine species of 39% 

Illegal and unregulated fishing constitutes an estimated 11-26 million tonnes (12-28%) of fishing worldwide 

Almost 30% of fish stocks commercially fished are over-fished 

I have witnessed only too many times the above-mentioned impact in real life while diving or fishing myself (in a sustainable manner). Once while fishing in Mexico, a local fisherman told me that his father used to catch huge tunas (50kg+) using a simple net from the shore while now finding these types of fish require going out at sea more than 100 miles away. Following this experience, after a disappointing dive in what was supposed to be one of the best diving spots in the world (Pemba Island, Tanzania), I asked the local diving supervisor why we almost did not encounter any fish. He told me that the fish mostly disappeared 20 years ago because of people fishing with dynamite in the reefs.

We  need to do more in order to preserve our oceans and meet the sustainable development goal number 14 which aims at preserving life below water. If not for us than for the future generations of local communities that rely on these ecosystems.''';
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: _blogDetailBody(),
    );
  }

  _blogDetailBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                flex: 6,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  //clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    r'assets/images/Mask group_01.png',
                    fit: BoxFit.fill,
                  ),
                )),
            Flexible(flex: 2, child: _blogTitle()),
            Flexible(flex: 1, child: _blogWriterName()),
            Flexible(
                flex: 9,
                child: SingleChildScrollView(
                  child: _readBlog(),
                )),
            Flexible(flex: 1, child: _blogDate()),
          ],
        ),
        Positioned(
          top: size.height * 0.060,
          bottom: size.height - size.height * 0.10,
          left: size.width - size.width * 0.97,
          child: RoundButton(
              onTap: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white.withOpacity(0.3),
              )),
        ),
      ],
    );
  }

  Widget _blogTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'What is ocean acidification and how we can we preserve our oceans?',
        style: _blogTitleStyle(),
      ),
    );
  }

  Widget _blogWriterName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'WRITTEN BY Jérémie Layani',
        textAlign: TextAlign.start,
        style: _blogWriterNameStyle(),
      ),
    );
  }

  _blogTitleStyle() {
    return GoogleFonts.poppins(
        color: const Color(0xFF4267AC),
        fontSize: size.height * 0.020,
        fontWeight: FontWeight.w500);
  }

  _blogWriterNameStyle() {
    return GoogleFonts.portLligatSlab(
        color: const Color(0xFF000000), fontSize: size.height * 0.016);
  }

  _readBlog() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ExpandableText(
        expandText: 'More',
        readbolog,
        maxLines: 20,
        expandOnTextTap: true,
        collapseText: 'less',
        linkColor: Colors.black,
        style: readbologStyle(),
      ),
    );
  }

  readbologStyle() {
    return GoogleFonts.poppins(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.015);
  }

  _blogDate() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text('29 August 2022'),
    );
  }
}



// Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Flexible(
//             flex: 5,
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: Image.asset(
//                 r'assets/images/Mask group_01.png',
//                 fit: BoxFit.fill,
//               ),
//             )),
//         Flexible(flex: 2, child: _blogTitle()),
//         Flexible(flex: 1, child: _blogWriterName()),
//         Flexible(
//             flex: 9,
//             child: SingleChildScrollView(
//               child: _readBlog(),
//             )),
//         Flexible(flex: 1, child: _blogDate()),
//       ],
//     );