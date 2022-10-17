// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_constants.dart';

class SignUpPageTextFeild extends StatelessWidget {
  const SignUpPageTextFeild({
    Key? key,
    this.controller,
    this.maxLines,
    this.minLines,
    required this.hintText,
    this.maxLength,
    this.counterStyle,
    this.hintStyle,
    required this.autofocus,
    required this.labelText,
    this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final String hintText;
  final int? maxLength;
  final TextStyle? counterStyle;
  final TextStyle? hintStyle;
  final bool autofocus;
  final String labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      autofocus: autofocus,
      validator: validator,
      decoration: InputDecoration(
        label: Text(labelText),
        disabledBorder: InputBorder.none,
        floatingLabelStyle:
            GoogleFonts.actor(color: ColorConstants.buttonColorLight),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: size.width * 0.003)),
        border: const UnderlineInputBorder(borderSide: BorderSide(width: 3)),
        constraints: BoxConstraints(maxWidth: size.width * 0.7),
        hintText: hintText,
      ),
    );
  }
}
