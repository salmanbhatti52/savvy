// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_constants.dart';

class SignUpPageTextFeild extends StatelessWidget {
  const SignUpPageTextFeild({
    Key? key,
    required this.controller,
    this.maxLines,
    this.minLines,
    required this.hintText,
    this.maxLength,
    this.counterStyle,
    this.hintStyle,
    required this.autofocus,
    required this.labelText,
    this.validator,
    required this.obscureText,
    this.suffixIcon,
    this.suffix,
    this.inputType,
  }) : super(key: key);

  final TextEditingController controller;
  final int? maxLines;
  final int? minLines;
  final String hintText;
  final int? maxLength;
  final TextStyle? counterStyle;
  final TextStyle? hintStyle;
  final bool autofocus;
  final String labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? suffix;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      autofocus: autofocus,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        suffix: suffix,
        label: Text(labelText),
        disabledBorder: const OutlineInputBorder(),
        floatingLabelStyle:
            GoogleFonts.actor(color: ColorConstants.buttonColorLight),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: size.width * 0.003, color: Colors.transparent),
          borderRadius: BorderRadius.circular(size.width * 0.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: size.width * 0.003, color: Colors.transparent),
          borderRadius: BorderRadius.circular(size.width * 0.3),
        ),
        constraints: BoxConstraints(maxWidth: size.width * 0.8),
        hintText: hintText,
      ),
    );
  }
}
