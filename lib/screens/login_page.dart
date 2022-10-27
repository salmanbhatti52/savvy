import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:savvy/common/widgets/custom_button.dart';
import 'package:savvy/common/widgets/loader.dart';
import 'package:savvy/common/widgets/text_feilds.dart';
import 'package:savvy/models/login_user.dart';
import 'package:savvy/screens/features/otp_screen.dart';
import 'package:savvy/screens/intro_page.dart';
import 'package:savvy/screens/signup_page.dart';
import 'package:savvy/services/api_services.dart';
import 'package:savvy/utils/color_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String screenName = 'Login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final ApiServices _apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isClicked = true;
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        body: _builBody(),
      ),
    );
  }

  Widget _builBody() {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      const Flexible(flex: 1, child: SizedBox()),
      Flexible(flex: 4, child: _title()),
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
      const Flexible(flex: 2, child: SizedBox()),
      Flexible(flex: 1, child: _signInText()),
    ]);
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Login',
          style: GoogleFonts.aBeeZee(
              fontSize: size.height * 0.05,
              color: ColorConstants.introPageTextColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _textFeilds() {
    return Column(
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
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const OtpScreen();
                            },
                          ));
                        },
                        child: Text(
                          'Forgot Password?',
                          style: textStyle(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.007,
                    ),
                    Flexible(
                      child: Container(
                        width: size.width * 0.8,
                        color: Colors.transparent,
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

  Widget _loginButton() {
    return MyButton(
      ontap: () async {
        setState(() {
          isClicked = false;
        });

        Response response = await _apiServices.loginWithApi(Loginuser(
            userEmail: _emailController.text,
            userPassword: _passwordController.text,
            onesignalId: ""));
        debugPrint(_emailController.text);
        debugPrint(_passwordController.text);

        if (response.statusCode == 200 && mounted) {
          Navigator.popAndPushNamed(context, IntroPage.screenName);
          showToast('Login Successfull');
        } else {
          setState(() {
            isClicked = true;
          });
          showToast('Login Failed');
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
          : const Loader(),
    );
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

  _signInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(child: Text('Don’t Have an Account?')),
        Flexible(
            child: GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, SignUpPage.screenName);
          }),
          child: const Text(
            'Register',
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
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
  }
}
