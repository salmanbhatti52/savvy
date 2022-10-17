
// import 'package:flutter/material.dart';

// import 'page_view_Screens/page_view_screen_three.dart';

// class IntroPageView extends StatefulWidget {
//   const IntroPageView({super.key});

//   @override
//   State<IntroPageView> createState() => _IntroPageViewState();
// }

// class _IntroPageViewState extends State<IntroPageView> {
//   final PageController _controller = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             flex: 20,
//             child: PageView(
//               scrollDirection: Axis.horizontal,
//               controller: _controller,
//               children: const [
//                 PageViewScreenOne(),
//                 PageViewScreenTwo(),
//                 PageViewScreenThree(),
//                 PageViewScreenFour(),
//                 PageViewScreenFive(),
//                 PageViewScreenSix(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }
