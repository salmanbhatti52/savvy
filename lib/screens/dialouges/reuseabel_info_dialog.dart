// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/widgets/custom_button.dart';

class ReuseableDialog extends StatelessWidget {
  const ReuseableDialog({
    Key? key,
    required this.bgColor,
    this.onTapClose,
    required this.goalNumber,
    required this.goalTitle,
    required this.goalDescription,
    required this.goalDetail,
  }) : super(key: key);

  final Color bgColor;
  final void Function()? onTapClose;
  final String goalNumber;
  final String goalTitle;
  final String goalDescription;
  final String goalDetail;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 20,
            height: size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                            child: InkWell(
                                onTap: onTapClose,
                                child: const Icon(Icons.close)))
                      ],
                    )),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.2,
                                  width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(0.1)),
                                  child: Text(
                                    goalNumber,
                                    style: textStyle(40),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Text(
                              goalTitle,
                              style: textStyle(19),
                            )),
                        Flexible(
                            flex: 3,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              goalDescription,
                              style: textStyle(size.height * 0.018),
                            )),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1.0,
                  color: Colors.white,
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Text(
                              maxLines: 4,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              goalDetail,
                              style: textStyle(size.height * 0.015),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 2,
                            child: MyButton(
                              ontap: () {},
                              color: Colors.black.withOpacity(0.1),
                              border: Border.all(width: 2, color: Colors.white),
                              height: size.height * 0.050,
                              radius: 20,
                              width: size.width * 0.4,
                              spreadRadius: 0,
                              child: Text(
                                'More info',
                                style: textStyle(18.0),
                              ),
                            ),
                          ),
                          const Flexible(flex: 1, child: SizedBox()),
                        ],
                      ),
                    )),
              ],
            )),
      ),
    );
  }

  textStyle(double height) {
    return GoogleFonts.poppins(fontSize: height, color: Colors.white);
  }
}
