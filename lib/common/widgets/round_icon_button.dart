// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:savvy/utils/color_constants.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);
  final Widget icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: 40,

        // alignment: Alignment.centerRight,
        decoration: const BoxDecoration(
          //  borderRadius: BorderRadius.circular(size.width * 0.3),
          shape: BoxShape.circle,
          color: ColorConstants.introPageTextColor,
        ),
        child: icon,
      ),
    );
  }
}
