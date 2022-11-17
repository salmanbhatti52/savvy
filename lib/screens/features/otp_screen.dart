import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:savvy/common/widgets/custom_button.dart';
import 'package:savvy/common/widgets/otp_screen_textfeild.dart';
import 'package:savvy/common/widgets/round_icon_button.dart';
import 'package:savvy/controllers/reset_password_controllers/user_id_controller.dart';
import 'package:savvy/screens/features/reset_screen.dart';
import 'package:savvy/utils/color_constants.dart';

import '../../services/api_services.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late TextEditingController _emailController;
  final ApiServices _apiServices = ApiServices();
  final iDController = Get.put(UserIdController());
  bool isNotLoading = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
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
          FocusScope.of(context).unfocus();
          setState(() {
            isNotLoading = false;
          });
          http.Response response = await _apiServices
              .getOtpWithApi(_emailController.text.toString());

          if (response.statusCode == 200 && mounted) {
            Navigator.pushNamed(context, ResetScreen.screenName);
            var data = jsonDecode(response.body);
            String userId = data["data"]["users_customers_id"];

            iDController.setUserId(userId);

            Fluttertoast.showToast(msg: 'Otp Sent to EmailAddress');
          } else {
            setState(() {
              isNotLoading = true;
            });
            Fluttertoast.showToast(msg: 'Something went Wrong');
          }
        },
        radius: size.width * 0.07,
        color: ColorConstants.buttonColorLight,
        height: size.height * 0.06,
        width: size.width * 0.6,
        spreadRadius: 0,
        child: isNotLoading
            ? Text(
                'RESET PASSWORD',
                style: GoogleFonts.poppins(
                    fontSize: size.height * 0.02, color: Colors.white),
              )
            : const CircularProgressIndicator());
  }

  Widget _textFeild() {
    return Column(
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'Email',
                          style: textStyle(),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.007,
                      ),
                      Flexible(
                        child: OtpTextFeild(
                          controller: _emailController,
                          validator:
                              ValidationBuilder().email().maxLength(50).build(),
                          hintText: 'Enter Email',
                          autofocus: false,
                        ),
                      )
                    ],
                  ),
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
