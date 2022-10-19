import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:savvy/common/widgets/update_textfeilds.dart';
import 'package:savvy/models/user.dart';
import 'package:savvy/screens/features/reset_screen.dart';
import 'package:savvy/services/api_services.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.user});
  final User? user;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final ApiServices _apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(child: Text('Enter Your Email to Get Otp')),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                child: UpdateTextFeild(
                    controller: _emailController,
                    hintText: 'Enter Email',
                    autofocus: false,
                    labelText: 'Email'),
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: () async {
                  Response response =
                      await _apiServices.getOtpWithApi(_emailController.text);
                  if (response.statusCode == 200 && mounted) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        String id = widget.user!.data.user.usersCustomersId;
                        print("${id}at otp Screen");

                        return ResetScreen(
                          userId: id,
                        );
                      },
                    ));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return otpAlertDialog(response.body.toString());
                      },
                    );
                  }
                },
                child: const Text('Get Otp'),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget otpAlertDialog(String text) {
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
