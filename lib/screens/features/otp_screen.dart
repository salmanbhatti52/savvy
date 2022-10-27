import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/common/widgets/custom_button.dart';
import 'package:savvy/common/widgets/otp_screen_textfeild.dart';
import 'package:savvy/common/widgets/round_icon_button.dart';
import 'package:savvy/screens/features/reset_screen.dart';
import 'package:savvy/utils/color_constants.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Flexible(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(flex: 1, child: _iconButton()),
                Flexible(flex: 4, child: _lockImage()),
                Flexible(flex: 1, child: _forgotPasswordText()),
                Flexible(flex: 1, child: _descriptionText()),
                Flexible(flex: 2, child: _textFeild()),
                Flexible(flex: 1, child: _actionButton()),
              ],
            ),
          ),
          Flexible(child: Column()),
        ],
      ),
    );
  }

  Widget _iconButton() {
    return Row(
      children: [
        InkWell(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const RoundButton(
                icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
          ),
        )
      ],
    );
  }

  Widget _lockImage() {
    return Image.asset(r'assets/images/Lockpng.png');
  }

  Widget _forgotPasswordText() {
    return Text(
      'Forgot Password?',
      style: GoogleFonts.abel(
          fontSize: size.height * 0.03,
          color: ColorConstants.introPageTextColor,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _descriptionText() {
    return Text(
      'Enter your email address to reset\npassowrd.',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: const Color(0xFF606367), fontSize: size.height * 0.015),
    );
  }

  Widget _actionButton() {
    return MyButton(
        ontap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const ResetScreen();
            },
          ));
        },
        radius: size.width * 0.07,
        color: ColorConstants.buttonColorLight,
        height: size.height * 0.06,
        width: size.width * 0.6,
        spreadRadius: 0,
        child: Text(
          'Done',
          style: GoogleFonts.adamina(
              fontSize: size.height * 0.02, color: Colors.white),
        ));
  }

  Widget _textFeild() {
    return Column(
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        'Enter Email',
                        style: textStyle(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.007,
                    ),
                    Flexible(
                      child: OtpTextFeild(
                        controller: TextEditingController(),
                        hintText: '',
                        autofocus: false,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  textStyle() {
    return GoogleFonts.aBeeZee(
      color: ColorConstants.introPageTextColor,
      fontSize: size.height * 0.02,
    );
  }
}
