import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/common/widgets/otp_screen_textfeild.dart';
import 'package:savvy/services/api_services.dart';

import '../../common/widgets/custom_button.dart';
import '../../common/widgets/loader.dart';
import '../../utils/color_constants.dart';
import '../intro_page.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key, this.userId});
  final String? userId;

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final ApiServices _apiServices = ApiServices();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: OtpTextFeild(
                    controller: _otpController,
                    hintText: 'Enter OTP',
                    autofocus: false,
                    labelText: 'OTP'),
              ),
              addVerticalSpace(size),
              Flexible(
                child: OtpTextFeild(
                    controller: _passwordController,
                    hintText: 'New Password',
                    autofocus: false,
                    labelText: 'Password'),
              ),
              addVerticalSpace(size),
              Flexible(
                child: OtpTextFeild(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    autofocus: false,
                    labelText: 'Confirm'),
              ),
              addVerticalSpace(size),
              Flexible(
                child: MyButton(
                  ontap: () {
                    setState(() {
                      isClicked = true;
                    });
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        isClicked = false;
                        return const IntroPage();
                      },
                    ));
                  },
                  radius: size.width * 0.07,
                  color: ColorConstants.buttonColorLight,
                  height: size.height * 0.06,
                  width: size.width * 0.6,
                  spreadRadius: 0,
                  child: !isClicked
                      ? Text(
                          '''Done''',
                          style: GoogleFonts.abel(
                              fontSize: size.height * 0.02,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      : const Loader(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addVerticalSpace(Size size) {
    return SizedBox(
      height: size.height * 0.03,
    );
  }

  Widget resetScreenAlertDialog(String text) {
    return AlertDialog(
      content: Text(text),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Try Again')),
      ],
    );
  }
}
