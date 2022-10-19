import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:savvy/screens/intro_page.dart';
import 'package:savvy/services/api_services.dart';

import '../../common/widgets/update_textfeilds.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key, required this.userId});
  final String userId;

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final ApiServices _apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: UpdateTextFeild(
                    controller: _otpController,
                    hintText: 'Enter OTP',
                    autofocus: false,
                    labelText: 'OTP'),
              ),
              addVerticalSpace(size),
              Flexible(
                child: UpdateTextFeild(
                    controller: _passwordController,
                    hintText: 'New Password',
                    autofocus: false,
                    labelText: 'Password'),
              ),
              addVerticalSpace(size),
              Flexible(
                child: UpdateTextFeild(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    autofocus: false,
                    labelText: 'Confirm'),
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: () async {
                  var id = widget.userId;
                  // print("${id}at reset Screen");
                  Response response = await _apiServices.resetPasswordWithApi(
                      id,
                      _otpController.text,
                      _passwordController.text,
                      _confirmPasswordController.text);

                  if (response.statusCode == 200 && mounted) {
                    Navigator.popUntil(
                        context, ModalRoute.withName(IntroPage.screenName));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return resetScreenAlertDialog(response.body.toString());
                      },
                    );
                  }
                },
                child: const Text('Done'),
              )),
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
