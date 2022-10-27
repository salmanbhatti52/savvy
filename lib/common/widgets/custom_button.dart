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
  }) : super(key: key);

  final double radius;
  final Color color;
  final Widget child;
  final double height;
  final double width;
  final VoidCallback? ontap;
  final double? spreadRadius;

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        // boxShadow: [
        //   BoxShadow(
        //       offset: Offset(size.width, 0),
        //       blurRadius: 5,
        //       blurStyle: BlurStyle.inner),
        //   BoxShadow(
        //       offset: const Offset(4, 4),
        //       blurRadius: 2,
        //       spreadRadius: spreadRadius,
        //       color: Colors.grey.shade400,
        //       blurStyle: BlurStyle.normal),
        // ],
      ),
      child: InkWell(onTap: ontap, child: child),
    );
  }
}
