import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:savvy/common/widgets/loader.dart';
import 'package:savvy/models/create_user.dart';
import 'package:savvy/screens/intro_page.dart';
import 'package:savvy/screens/login_page.dart';
import 'package:savvy/services/api_services.dart';

import '../common/widgets/custom_button.dart';
import '../common/widgets/text_feilds.dart';
import '../utils/color_constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String screenName = 'SignUp';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final ApiServices _apiServices = ApiServices();
  final _formKey = GlobalKey<FormState>();
  bool isClicked = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _builBody(),
      ),
    );
  }

  Widget _builBody() {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      const Flexible(flex: 1, child: SizedBox()),
      Flexible(flex: 2, child: _title()),
      Flexible(flex: 7, child: _textFeilds()),
      Flexible(flex: 2, child: _loginButton()),
      Flexible(
          flex: 1,
          child: Text(
            'OR',
            style: GoogleFonts.aBeeZee(
                color: const Color(0xFF5D407B), fontSize: size.height * 0.017),
          )),
      Flexible(flex: 1, child: _signInWith()),
      Flexible(flex: 1, child: _policyText()),
      Flexible(flex: 1, child: _signInText()),
    ]);
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sign up',
          style: GoogleFonts.aBeeZee(
              fontSize: size.height * 0.05,
              color: ColorConstants.introPageTextColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _textFeilds() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          'First Name',
                          style: textStyle(),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.007,
                      ),
                      Flexible(
                        child: SignUpPageTextFeild(
                            controller: _nameController,
                            hintText: '',
                            autofocus: false,
                            labelText: '',
                            obscureText: false),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                          'Email',
                          style: textStyle(),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.007,
                      ),
                      Flexible(
                        child: SignUpPageTextFeild(
                            controller: _emailController,
                            hintText: '',
                            autofocus: false,
                            labelText: '',
                            obscureText: false),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                          'Password',
                          style: textStyle(),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.007,
                      ),
                      Flexible(
                        child: SignUpPageTextFeild(
                            controller: _passwordController,
                            hintText: '',
                            autofocus: false,
                            labelText: '',
                            obscureText: true),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return MyButton(
        ontap: () async {
          setState(() {
            isClicked = false;
          });
          Response response = await _apiServices.signUpWithApi(CreateUser(
              onesignalId: "",
              fullName: _nameController.text,
              userEmail: _emailController.text,
              userPassword: _passwordController.text,
              notificationSwitch: "yes"));

          if (response.statusCode == 200 && mounted) {
            Navigator.pushNamed(context, IntroPage.screenName);
            showToast('User Created Successfully');
          } else {
            setState(() {
              isClicked = true;
            });
            showToast('Something went Wrong');
          }
        },
        radius: size.width * 0.07,
        color: ColorConstants.buttonColorLight,
        height: size.height * 0.06,
        width: size.width * 0.6,
        spreadRadius: 0,
        child: isClicked
            ? Text(
                '''Let's Go!''',
                style: GoogleFonts.adamina(
                    fontSize: size.height * 0.02, color: Colors.white),
              )
            : const Loader());
  }

  Widget _signInWith() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: SvgPicture.asset(r'assets/svgs/googlesvg.svg')),
          Flexible(child: SvgPicture.asset(r'assets/svgs/fbsvg.svg')),
        ],
      ),
    );
  }

  Widget _policyText() {
    return Column(
      children: const [
        Flexible(
            child: Text('Creating an account means that you’re okay with our')),
        Flexible(
          child: Text(
            ' Terms of Service and  Privacy Policy.',
            style: TextStyle(color: ColorConstants.introPageTextColor),
          ),
        ),
      ],
    );
  }

  Widget _signInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(child: Text('Have an Account?')),
        Flexible(
            child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, LoginPage.screenName);
          },
          child: const Text(
            'Sign In',
            style: TextStyle(color: ColorConstants.buttonColorLight),
          ),
        )),
      ],
    );
  }

  textStyle() {
    return GoogleFonts.aBeeZee(
      color: ColorConstants.introPageTextColor,
      fontSize: size.height * 0.02,
    );
  }

  showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
  }
}
