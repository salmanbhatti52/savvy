// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpTextFeild extends StatelessWidget {
  const OtpTextFeild({
    Key? key,
    required this.controller,
    this.maxLines,
    this.minLines,
    required this.hintText,
    this.maxLength,
    this.counterStyle,
    this.hintStyle,
    required this.autofocus,
    this.labelText,
    this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final int? maxLines;
  final int? minLines;
  final String hintText;
  final int? maxLength;
  final TextStyle? counterStyle;
  final TextStyle? hintStyle;
  final bool autofocus;
  final String? labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      autofocus: autofocus,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.3),
        //label: Text(labelText),
        disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: size.width * 0.003, color: Colors.transparent),
        ),
        floatingLabelStyle: GoogleFonts.actor(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              BorderSide(width: size.width * 0.003, color: Colors.transparent),
        ),
        border: const OutlineInputBorder(borderSide: BorderSide(width: 3)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              BorderSide(width: size.width * 0.003, color: Colors.transparent),
        ),
        constraints: BoxConstraints(
            maxWidth: size.width * 0.7, minWidth: size.width * 0.6),
        hintText: hintText,
      ),
    );
  }
}
