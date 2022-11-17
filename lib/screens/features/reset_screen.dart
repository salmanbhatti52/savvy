import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:savvy/common/widgets/otp_screen_textfeild.dart';
import 'package:savvy/controllers/reset_password_controllers/user_id_controller.dart';
import 'package:savvy/screens/intro_page.dart';
import 'package:savvy/services/api_services.dart';

import '../../common/widgets/custom_button.dart';
import '../../common/widgets/round_icon_button.dart';
import '../../utils/color_constants.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key, this.userId});
  final String? userId;
  static const String screenName = '/ResetScreen';

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final iDController = Get.find<UserIdController>();

  final ApiServices _apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var viewinset = MediaQuery.of(context).viewInsets.bottom;
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: SingleChildScrollView(
            physics: viewinset > 0
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size.height,
        child: Column(
          children: [
            Flexible(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(flex: 1, child: _iconButton()),
                  Flexible(flex: 4, child: _lockImage()),
                  Flexible(flex: 1, child: _forgotPasswordText()),
                  Flexible(flex: 1, child: _descriptionText()),
                  Flexible(flex: 2, child: _textFeild()),
                  Flexible(flex: 2, child: _passwordTextFeild()),
                  Flexible(flex: 2, child: _confirmPasswordTextFeild()),
                  Flexible(flex: 1, child: _actionButton()),
                ],
              ),
            ),
            Flexible(child: Column()),
          ],
        ),
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
      'Reset Password?',
      style: GoogleFonts.lato(
          fontSize: size.height * 0.03,
          color: ColorConstants.introPageTextColor,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _descriptionText() {
    return Text(
      'Enter your email address to reset\npassowrd.',
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          color: const Color(0xFF606367), fontSize: size.height * 0.015),
    );
  }

  Widget _actionButton() {
    return MyButton(
        ontap: () async {
          String id = iDController.getUserId();
          // print('id at reset screen $id');
          http.Response response = await _apiServices.resetPasswordWithApi(
              id,
              _otpController.text,
              _passwordController.text,
              _confirmPasswordController.text);

          if (response.statusCode == 200 && mounted) {
            Navigator.popAndPushNamed(context, IntroPage.screenName);
          } else {
            Fluttertoast.showToast(msg: 'Something went Wrong');
          }
        },
        radius: size.width * 0.07,
        color: ColorConstants.buttonColorLight,
        height: size.height * 0.06,
        width: size.width * 0.6,
        spreadRadius: 0,
        child: Text(
          'RESET PASSWORD',
          style: GoogleFonts.poppins(
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
                        'OTP',
                        style: textStyle(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.007,
                    ),
                    Flexible(
                      child: OtpTextFeild(
                        controller: _otpController,
                        hintText: 'Enter Otp',
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

  Widget _passwordTextFeild() {
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
                        'New Password',
                        style: textStyle(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.007,
                    ),
                    Flexible(
                      child: OtpTextFeild(
                        controller: _passwordController,
                        hintText: 'Enter New Password',
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

  Widget _confirmPasswordTextFeild() {
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
                        'Confirm Password',
                        style: textStyle(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.007,
                    ),
                    Flexible(
                      child: OtpTextFeild(
                        controller: _confirmPasswordController,
                        hintText: 'Confirm Password',
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
    return GoogleFonts.poppins(
      color: ColorConstants.buttonColorLight,
      fontSize: size.height * 0.02,
    );
  }
}
