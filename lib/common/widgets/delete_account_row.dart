// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RowDeleteMyAccount extends StatelessWidget {
  const RowDeleteMyAccount({
    Key? key,
    required this.leading,
    required this.text,
  }) : super(key: key);
  final Checkbox leading;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(flex: 1, child: leading),
        Expanded(flex: 7, child: text),
      ],
    );
  }
}
