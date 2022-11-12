// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyExpansionTile extends StatelessWidget {
  const MyExpansionTile({
    Key? key,
    this.sideContainer,
    required this.image,
    required this.tileText,
    this.dropDownButton,
    this.color,
    required this.child,
    this.onExpansionChanged,
    this.initiallyExpanded = false,
  }) : super(key: key);

  final Widget? sideContainer;
  final Widget image;
  final Widget tileText;
  final Widget? dropDownButton;
  final Color? color;
  final Widget child;
  final void Function(bool)? onExpansionChanged;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Expanded(flex: 1, child: sideContainer),
        Expanded(
            flex: 60,
            child: ExpansionTile(
              initiallyExpanded: initiallyExpanded,
              title: tileText,
              maintainState: false,
              onExpansionChanged: onExpansionChanged,
              leading: image,
              backgroundColor: color,
              collapsedBackgroundColor: color,
              children: [
                child,
              ],
            )),
      ],
    );
  }
}
