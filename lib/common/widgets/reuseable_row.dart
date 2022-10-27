// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class ReuseableRow extends StatelessWidget {
  const ReuseableRow({
    Key? key,
    required this.listTile,
    required this.sideContainer,
  }) : super(key: key);

  final Widget listTile;
  final Widget sideContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      //    decoration: const BoxDecoration(color: ColorConstants.slectedPlanBg),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(flex: 1, child: sideContainer),
          Expanded(flex: 60, child: listTile),
        ],
      ),
    );
  }
}
