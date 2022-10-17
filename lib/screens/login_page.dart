import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:savvy/models/login_user.dart';
import 'package:savvy/screens/intro_page.dart';
import 'package:savvy/services/api_services.dart';

import '../common/widgets/custom_button.dart';
import '../common/widgets/text_feilds.dart';
import '../utils/color_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiServices _apiServices = ApiServices();

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Positioned(
          left: size.width * 0.52,
          child: SizedBox(
              child: SvgPicture.asset(
            r'assets/svgs/signupleafs.svg',
            fit: BoxFit.scaleDown,
          )),
        ),
        Positioned(
          child: SizedBox(
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(flex: 3, child: SizedBox()),
                Expanded(flex: 2, child: _title()),
                Expanded(flex: 2, child: _signInWith()),
                Expanded(flex: 6, child: _textFeilds()),
                Expanded(flex: 1, child: SizedBox(child: _actionButton())),
                Expanded(flex: 2, child: _policyText()),
                const Expanded(flex: 3, child: SizedBox())
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _title() {
    return Row(
      children: [
        _addHorizontalSpace(size.width * 0.3),
        Text(
          'Log In',
          style: GoogleFonts.abhayaLibre(fontSize: 45),
        ),
      ],
    );
  }

  Widget _signInWith() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _addHorizontalSpace(size.width * 0.21),
        const Text('with'),
        _addHorizontalSpace(size.width * 0.21),
        SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(r'assets/images/googlepng.png'),
        ),
        _addHorizontalSpace(size.width * 0.07),
        SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(r'assets/images/facebookpng.png'),
        ),
      ],
    );
  }

  Widget _textFeilds() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _addHorizontalSpace(size.width * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SignUpPageTextFeild(
                controller: _emailController,
                hintText: 'Enter your Email',
                autofocus: true,
                labelText: 'Enter Email',
              ),
            ),
            Expanded(
              child: SignUpPageTextFeild(
                  controller: _passwordController,
                  hintText: 'Enter Password Here',
                  autofocus: false,
                  labelText: 'Password'),
            ),
            const Expanded(
              child: SizedBox(),
            )
          ],
        ),
      ],
    );
  }

  Widget _actionButton() {
    return MyButton(
      ontap: () async {
        Response response = await _apiServices.loginWithApi(Loginuser(
            userEmail: _emailController.text.toString(),
            userPassword: _passwordController.text.toString(),
            onesignalId: "onesignal_id"));

        if (response.statusCode == 200 && mounted) {
          print(_emailController.text);
          print(_passwordController.text);
          print('okay');
          print(response.statusCode.toString());
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const IntroPage();
            },
          ));
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return loginFailedAlertDialog(response.body.toString());
            },
          );
        }

        debugPrint(_emailController.text);
        debugPrint(_passwordController.text);
      },
      width: size.width * 0.6,
      height: size.height * 0.1,
      radius: size.height * 0.03,
      spreadRadius: 2,
      color: ColorConstants.buttonColor,
      child: Text(
        'Log In',
        style: GoogleFonts.aBeeZee(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _addHorizontalSpace(double space) {
    return SizedBox(
      width: space,
    );
  }

  Widget _policyText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Creating an account means that\nyou’re okay with our Terms of\nService and Privacy Policy.',
          style: TextStyle(fontSize: size.height * 0.017),
        )
      ],
    );
  }

  Widget loginFailedAlertDialog(String text) {
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
