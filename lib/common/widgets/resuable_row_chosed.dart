// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_constants.dart';

class ChoosedRow extends StatelessWidget {
  const ChoosedRow({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.leading,
    this.ontap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Widget leading;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border:
                Border.all(color: ColorConstants.buttonColorLight, width: 2),
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.width * 0.02)),
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.005),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Flexible(child: leading)],
                ),
              ),
              SizedBox(
                width: size.width * 0.010,
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          title,
                          style: tileHeadingStyle(size),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.007,
                      ),
                      Flexible(
                        flex: 2,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          subtitle,
                          maxLines: 2,
                          style: tileDescriptionStyle(size),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  tileHeadingStyle(Size size) {
    return GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: size.height * 0.018,
        color: ColorConstants.introPageTextColor);
  }

  tileDescriptionStyle(Size size) {
    return GoogleFonts.poppins(
        color: ColorConstants.introPageTextColor,
        fontSize: size.height * 0.022);
  }
}
