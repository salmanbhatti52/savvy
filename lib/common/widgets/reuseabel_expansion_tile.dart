// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class MyExpansionTile extends StatelessWidget {
  const MyExpansionTile({
    Key? key,
    required this.sideContainer,
    required this.image,
    required this.tileText,
    this.dropDownButton,
    this.color,
    required this.child,
  }) : super(key: key);

  final Widget sideContainer;
  final Widget image;
  final Widget tileText;
  final Widget? dropDownButton;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: sideContainer),
        Expanded(
            flex: 60,
            child: ExpansionTileCard(
              title: tileText,
              leading: image,
              baseColor: color,
              children: [
                child,
              ],
            )),
      ],
    );
  }
}
