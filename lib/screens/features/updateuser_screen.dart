import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/common/widgets/otp_screen_textfeild.dart';
import 'package:savvy/models/user.dart';
import 'package:savvy/services/api_services.dart';

import '../../common/widgets/custom_button.dart';
import '../../utils/color_constants.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, this.user});
  final User? user;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiServices _apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // print("${widget.user!.data.user.usersCustomersId}at update page");
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  flex: 2, child: Image.asset(r'assets/images/updatepng.png')),
              Flexible(
                child: OtpTextFeild(
                    controller: _nameController,
                    hintText: 'Enter name',
                    autofocus: false,
                    labelText: 'name'),
              ),
              addVerticalSpace(size),
              Flexible(
                child: OtpTextFeild(
                    controller: _emailController,
                    hintText: 'Enter Email',
                    autofocus: false,
                    labelText: 'Email'),
              ),
              addVerticalSpace(size),
              Flexible(
                child: OtpTextFeild(
                    controller: _passwordController,
                    hintText: 'Enter Password',
                    autofocus: false,
                    labelText: 'password'),
              ),
              addVerticalSpace(size),
              Flexible(
                  child: MyButton(
                radius: size.width * 0.07,
                color: ColorConstants.buttonColorLight,
                height: size.height * 0.06,
                width: size.width * 0.6,
                spreadRadius: 0,
                child: Text(
                  'Update',
                  style: GoogleFonts.abel(
                      fontSize: size.height * 0.02,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget updateFailedAlertDialog(String text) {
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

  addVerticalSpace(Size size) {
    return SizedBox(
      height: size.height * 0.03,
    );
  }

  addHorizontalSpace(Size size) {
    return SizedBox(
      height: size.height * 0.03,
    );
  }
}
