// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class ReuseableRow extends StatelessWidget {
  const ReuseableRow({
    Key? key,
    required this.sideContainer,
    required this.image,
    required this.tileText,
    required this.dropDownButton,
    this.color,
  }) : super(key: key);

  final Widget sideContainer;
  final Widget image;
  final Widget tileText;
  final Widget dropDownButton;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      //    decoration: const BoxDecoration(color: ColorConstants.slectedPlanBg),
      //  alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: sideContainer),
          Expanded(
              flex: 60,
              child: Container(
                color: color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(flex: 4, child: image),
                          const Flexible(flex: 1, child: SizedBox()),
                        ],
                      ),
                    ),
                    Expanded(flex: 5, child: tileText),
                    Flexible(flex: 1, child: dropDownButton),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
