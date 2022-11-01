import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/screens/dialouges/detail_dialog.dart';

import '../../common/widgets/custom_button.dart';

class InfoDialog {
  Widget infoDialog(Size size, BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFEB1A3F),
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
                                onTap: () {
                                  Navigator.pop(context);
                                },
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
                                    '1',
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
                              'Goal 1',
                              style: textStyle(19),
                            )),
                        Flexible(
                            flex: 2,
                            child: Text(
                              'End poverty in all its forms everywhere.',
                              style: textStyle(18),
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
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              '''Today, 9.2% of the world survives on less than 1.90 a day, compared to nearly 36% in 1990.''',
                              style: textStyle(15),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 2,
                            child: MyButton(
                              ontap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    DetailDialog dialog = DetailDialog();
                                    return dialog.detailDialog(size, context);
                                  },
                                );
                              },
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
