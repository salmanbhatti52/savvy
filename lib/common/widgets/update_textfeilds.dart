import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateTextFeild extends StatelessWidget {
  const UpdateTextFeild({
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      autofocus: autofocus,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.3),
        label: Text(labelText),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: size.width * 0.003),
        ),
        floatingLabelStyle: GoogleFonts.actor(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: size.width * 0.003),
        ),
        border: const OutlineInputBorder(borderSide: BorderSide(width: 3)),
        constraints: BoxConstraints(maxWidth: size.width * 0.7),
        hintText: hintText,
      ),
    );
  }
}
