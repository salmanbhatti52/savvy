import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/screens/blogscreens/bolg_detail_screen.dart';
import 'package:savvy/utils/color_constants.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});
  static const String screenName = 'Blog Screen';
  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  late Size size;

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
      padding: EdgeInsets.all(size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 1, child: _titleRow()),
          Flexible(
              flex: 1,
              child: Text(
                'Recent Blogs',
                style: _textStyle(),
              )),
          Flexible(flex: 7, child: _blogCards()),
          Flexible(
              flex: 1,
              child: Text(
                'Your Favourites',
                style: _textStyle(),
              )),
          Flexible(flex: 10, child: _favroiteBlogs()),
        ],
      ),
    );
  }

  Widget _titleRow() {
    var title = SizedBox(
        height: 30, child: SvgPicture.asset(r'assets/svgs/appnamesvg.svg'));
    var icon = Icon(
      Icons.menu,
      size: size.height * 0.040,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Flexible(child: title)],
            )),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Flexible(child: icon)],
            )),
      ],
    );
  }

  Widget _blogCards() {
    return ListView.separated(
      itemBuilder: _itemBuilder,
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 10,
        );
      },
      itemCount: 7,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const BlogDetail();
          },
        ));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: size.width - size.width * 0.5,
            height: size.height * 0.30,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset(
              r'assets/images/Mask group_01.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              bottom: size.height * 0.020,
              left: size.width * 0.020,
              child: Container(
                height: size.height * 0.12,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.justify,
                          'Protecting our\nOceans',
                          maxLines: 2,
                          style: _textStyle(),
                        ),
                        const Text('29th Aug  10 mins'),
                      ]),
                ),
              ))
        ],
      ),
    );
  }

  Widget _favroiteBlogs() {
    return ListView.separated(
      itemBuilder: _favoriteItemBuilder,
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 10,
        );
      },
      itemCount: 7,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _favoriteItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const BlogDetail();
          },
        ));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width - size.width * 0.10 + 10,
            height: size.height * 0.5,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset(
              r'assets/images/Mask group 1.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              bottom: size.height * 0.010,
              left: size.width * 0.040,
              child: Container(
                height: size.height * 0.12,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'What are ETF’s?',
                          maxLines: 2,
                          style: _textStyle(),
                        ),
                        const Text('29th Aug  10 mins'),
                      ]),
                ),
              ))
        ],
      ),
    );
  }

  _textStyle() {
    return GoogleFonts.poppins(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.025,
        fontWeight: FontWeight.w400);
  }
}
