import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/screens/blogscreens/bolg_detail_screen.dart';
import 'package:savvy/screens/features/delete_my_account.dart';
import 'package:savvy/screens/post_page_view_screens/portfolio_screen.dart';
import 'package:savvy/screens/post_page_view_screens/select_plan_screen.dart';
import 'package:savvy/utils/color_constants.dart';
import '../../controllers/screen_six_controller/selected_sds_list.dart';
import '../../models/get_blogs_model.dart';
import '../login_page.dart';
import 'package:savvy/services/api_urls.dart';
import 'package:http/http.dart' as http;

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});
  static const String screenName = 'Blog Screen';
  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  Color systemUiOverlayColor = Colors.white;
  final controller = Get.find<SdgsListController>();
  List<GteBlogsModel> getBlogsList = [];

  late Size size;

  @override
  void initState() {
    super.initState();
    getAllBlogs();
  }
  bool mainLoader = true;

  Future<List<GteBlogsModel>> getAllBlogs() async {
    setState(() {
    mainLoader = true;
  });
    http.Response response =
    await http.get(Uri.parse(ApiUrls.baseUrl + ApiUrls.getAllBlogsApi));
    if (response.statusCode == 200) {
      Map jsonData = jsonDecode(response.body);

      for (int i = 0; i < jsonData['data'].length; i++) {
        Map<String, dynamic> obj = jsonData['data'][i];

        var pos = GteBlogsModel();
        pos = GteBlogsModel.fromJson(obj);
        getBlogsList.add(pos);
        print("getBlogsLength: ${getBlogsList.length}");
        print("getBlogsTitle: ${getBlogsList[i].title}");
        print("getBlogsLength: ${getBlogsList[i].dateAdded}");
        print("getBlogsLength: ${getBlogsList[i].dateModified}");
      }
      setState(() {
        mainLoader = false;
      });
      return getBlogsList;
    } else {
      throw Exception();
    }
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      //   backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      endDrawer: myEndDrawer(),
      onEndDrawerChanged: (isOpened) {
        if (isOpened == true) {
          setState(() {
            systemUiOverlayColor = const Color(0xFFCBF6E8);
          });
        } else {
          setState(() {
            systemUiOverlayColor = Colors.white;
          });
        }
      },
      drawerEnableOpenDragGesture: false,
      body: mainLoader ? const Center(child: CircularProgressIndicator(),):
      getBlogsList.isEmpty ? const Center(child: Text("No Blogs found",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),))
          : _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
          Flexible(flex: 10, child: _favoriteBlogs()),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: systemUiOverlayColor,
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
                        Navigator.pushNamed(
                            context, SelectPlanScreen.screenName);
                      },
                      child: Text(
                        'MY IMPACT',
                        style: _drawerTextStyle(),
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
                      style: _drawerTextStyle(),
                    ),
                  )),
                  Flexible(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'LEARN',
                      style: _drawerTextStyle(),
                    ),
                  )),
                  Flexible(
                      child: InkWell(
                    onTap: () {
                      controller.selectedSds = [];
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginPage.screenName, (route) => false);
                    },
                    child: Text(
                      'Logout',
                      style: _drawerTextStyle(),
                    ),
                  )),
                  Flexible(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, DeleteMyAccount.screenName),
                      child: Text(
                        '(Delete My Account)',
                        style: deleteAccountStyle(),
                      ),
                    ),
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

  Widget _blogCards() {
    return ListView.separated(
      itemBuilder: _itemBuilder,
      separatorBuilder: (context, index) {
        return const SizedBox(width: 10);
      },
      // itemCount: 7,
      itemCount: getBlogsList.length,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return BlogDetail(
              title: getBlogsList[index].title,
              image: getBlogsList[index].image,
              date: getBlogsList[index].dateModified,
              author: getBlogsList[index].author,
              description: getBlogsList[index].description,

            );
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
            child:
            Image.network(ApiUrls.baseUrl+ "${getBlogsList[index].image}", fit: BoxFit.fill, ),

            // Image.asset(r'assets/images/Mask group_01.png',
            //   fit: BoxFit.fill,),
          ),
          Positioned(
              bottom: size.height * 0.020,
              left: size.width * 0.020,
              child: Container(
                height: size.height * 0.125,
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
                          textAlign: TextAlign.left,
                          // 'Protecting our\nOceans',
                          "${getBlogsList[index].title}",
                          maxLines: 2,
                          style: _textStyle(),
                        ),
                        // const Text('29th Aug  10 mins'),
                        Text("${getBlogsList[index].dateModified}"),
                      ]),
                ),
              ))
        ],
      ),
    );
  }

  Widget _favoriteBlogs() {
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
            return BlogDetail(
              title: getBlogsList[index].title,
              image: getBlogsList[index].image,
              date: getBlogsList[index].dateModified,
              author: getBlogsList[index].author,
              description: getBlogsList[index].description,
            );
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
            child: Image.network(ApiUrls.baseUrl+ "${getBlogsList[index].image}", fit: BoxFit.fill, ),
            // Image.asset(
            //   r'assets/images/Mask group 1.png',
            //   fit: BoxFit.fill,
            // ),
          ),
          Positioned(
              bottom: size.height * 0.010,
              left: size.width * 0.040,
              child: Container(
                height: size.height * 0.125,
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
                          "${getBlogsList[index].title}",
                          maxLines: 2,
                          style: _textStyle(),
                        ),
                        Text('${getBlogsList[index].dateModified}'),
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

  _drawerTextStyle() {
    return GoogleFonts.firaSans(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.040,
        fontWeight: FontWeight.w300);
  }

  deleteAccountStyle() {
    return GoogleFonts.firaSans(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.017,
        fontWeight: FontWeight.w300);
  }
}
