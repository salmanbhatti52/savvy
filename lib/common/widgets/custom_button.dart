// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.radius,
    required this.color,
    required this.child,
    required this.height,
    required this.width,
    this.ontap,
    required this.spreadRadius,
    this.border,
  }) : super(key: key);

  final double radius;
  final Color color;
  final Widget child;
  final double height;
  final double width;
  final VoidCallback? ontap;
  final double? spreadRadius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          border: border,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child,
      ),
    );
  }
}
