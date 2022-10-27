import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonText {
  static buttonText(Size size) {
    return Text(
      '''Next''',
      style: GoogleFonts.adamina(
        fontSize: size.height * 0.025,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
