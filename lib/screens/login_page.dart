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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiServices _apiServices = ApiServices();
  final _loginFormKey = GlobalKey<FormState>();

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
    var viewinset = MediaQuery.of(context).viewInsets.bottom;
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            physics: viewinset > 0
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            child: _builBody()),
      ),
    );
  }

  Widget _builBody() {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.040),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Flexible(flex: 1, child: SizedBox()),
          Flexible(flex: 4, child: _title()),
          Flexible(flex: 7, child: _textFeilds()),
          Flexible(flex: 2, child: _loginButton()),
          const Flexible(flex: 1, child: SizedBox()),
          Flexible(
              flex: 1,
              child: Text(
                'OR',
                style: GoogleFonts.lato(
                    color: const Color(0xFF5D407B),
                    fontSize: size.height * 0.017),
              )),
          Flexible(flex: 1, child: _signInWith()),
          const Flexible(flex: 1, child: SizedBox()),
          Flexible(flex: 1, child: _signInText()),
          const Flexible(flex: 2, child: SizedBox()),
        ]),
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Login',
          style: GoogleFonts.lato(
              fontSize: size.height * 0.045,
              color: ColorConstants.introPageTextColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _textFeilds() {
    return Form(
      key: _loginFormKey,
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
                            hintText: 'email@example.com',
                            validator: _emailValidate,
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
                            hintText: '8 characters',
                            validator: _passwordValidate,
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
                            style: forgotTextStyle(),
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
      ),
    );
  }

  Widget _loginButton() {
    return MyButton(
      ontap: () async {
        setState(() {
          isClicked = false;
        });

        if (_loginFormKey.currentState!.validate()) {
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
        } else {
          setState(() {
            isClicked = true;
          });
        }
      },
      radius: size.width * 0.07,
      color: ColorConstants.buttonColorLight,
      height: size.height * 0.06,
      width: size.width * 0.6,
      spreadRadius: 0,
      child: isClicked
          ? Text(
              '''LET'S GO!''',
              style: GoogleFonts.lato(
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
        Flexible(
            child: Text(
          'Don’t Have an Account?',
          style: GoogleFonts.lato(fontSize: 15),
        )),
        const SizedBox(
          width: 3,
        ),
        Flexible(
            child: GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, SignUpPage.screenName);
          }),
          child: Text(
            'Register',
            style: GoogleFonts.lato(
                color: const Color(
                  0xFF38B68C,
                ),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        )),
      ],
    );
  }

  textStyle() {
    return GoogleFonts.lato(
      color: ColorConstants.introPageTextColor,
      fontSize: size.height * 0.02,
    );
  }

  forgotTextStyle() {
    return GoogleFonts.lato(
      color: const Color(0xFF606367),
      fontSize: size.height * 0.02,
    );
  }

  showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
  }

  String? _emailValidate(String? value) {
    if (value!.isEmpty) {
      return 'please enter email';
    }
    return null;
  }

  String? _passwordValidate(String? value) {
    if (value!.isEmpty && value.length > 8) {
      return 'please enter password';
    }
    return null;
  }
}
