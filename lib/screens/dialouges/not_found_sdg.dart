import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/utils/color_constants.dart';

class SdgDialog extends StatelessWidget {
  const SdgDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: size.height * 0.3,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close))
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    'There is no fund that aligns with this SDG for the moment.',
                    style: GoogleFonts.lato(
                        color: ColorConstants.buttonColorLight,
                        fontSize: size.height * 0.018),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    textAlign: TextAlign.start,
                    'Please select another SDG.',
                    style: GoogleFonts.lato(
                        color: const Color(0xFF1A1D48),
                        fontSize: size.height * 0.015),
                  ),
                ),
                Flexible(
                    child: Text(
                  '(SDG 8,9,10,15,16,17 are not selectable)',
                  style: GoogleFonts.lato(fontSize: size.height * 0.017),
                )),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: size.height * 0.15,
                          width: size.width * 0.40,
                          child: Image.asset(r'assets/images/notfoundsdg.png'))
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
