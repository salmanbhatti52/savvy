import 'dart:convert';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:savvy/common/widgets/loader.dart';
import 'package:savvy/controllers/intro_page_controller.dart';
import 'package:savvy/models/create_user.dart';
import 'package:savvy/screens/intro_page.dart';
import 'package:savvy/screens/login_page.dart';
import 'package:savvy/services/api_services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  late TextEditingController _lastNameController;
  final ApiServices _apiServices = ApiServices();
  final _formKey = GlobalKey<FormState>();
  bool isClicked = true;
  final userNameController = Get.put(IntroPageController());
  bool socialLoginEnable = false;

  @override
  void initState() {
    super.initState();
    socialLoginEnabled();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

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
        padding: EdgeInsets.symmetric(vertical: size.height * 0.060),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          //const Flexible(flex: 1, child: SizedBox()),
          Flexible(flex: 2, child: _title()),
          Flexible(flex: 9, child: _textFeilds()),
          Flexible(flex: 2, child: _loginButton()),
          //const Flexible(flex: 1, child: SizedBox()),
          Flexible(
              flex: 1,
              child: socialLoginEnable
                  ? Text(
                      'OR',
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF5D407B),
                          fontSize: size.height * 0.017),
                    )
                  : const SizedBox()),
          Flexible(
              flex: 1,
              child: socialLoginEnable ? _signInWith() : const SizedBox()),
          Flexible(flex: 1, child: _policyText()),
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
          'Sign up',
          style: GoogleFonts.lato(
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
                            hintText: 'Ellen',
                            autofocus: false,
                            validator: _nameValidate,
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
                          'Last Name',
                          style: textStyle(),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.007,
                      ),
                      Flexible(
                        child: SignUpPageTextFeild(
                            controller: _lastNameController,
                            hintText: '',
                            autofocus: false,
                            validator: _nameValidate,
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
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                          validator:
                              ValidationBuilder().email().maxLength(50).build(),
                          autofocus: false,
                          labelText: '',
                          obscureText: false),
                    )
                  ],
                ),
              ),
            ]),
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
                            hintText: 'Enter Min 5 Character',
                            validator: ValidationBuilder()
                                .minLength(5)
                                .maxLength(50)
                                .build(),
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

          SharedPreferences pref = await SharedPreferences.getInstance();

          if (_formKey.currentState!.validate()) {
            http.Response response = await _apiServices.signUpWithApi(
                CreateUser(
                    onesignalId: "",
                    firstName: _nameController.text,
                    lastName: _lastNameController.text,
                    userEmail: _emailController.text,
                    userPassword: _passwordController.text,
                    notificationSwitch: "yes"));

            print(_nameController.text);
            print(_lastNameController.text);
            print(_emailController.text);

            print(_passwordController.text);

            if (response.statusCode == 200 && mounted) {
              var data = jsonDecode(response.body);
              String userName = data["data"]["user"]["first_name"];
              pref.setString('UserName', userName);
              debugPrint("loginpageuser name   $userName");
              Navigator.popAndPushNamed(context, IntroPage.screenName);
              userNameController.setUserName(_nameController.text);
              showToast('User Created Successfully');
            } else {
              var data = jsonDecode(response.body);
              setState(() {
                isClicked = true;
              });
              showToast(data['message']);
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
                '''LET'S GO''',
                style: GoogleFonts.lato(
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
      children: [
        Flexible(
            child: Text(
          'Creating an account means that you???re okay with our',
          style: GoogleFonts.lato(),
        )),
        Flexible(
          child: Text(
            ' Terms of Service and  Privacy Policy.',
            style: GoogleFonts.lato(color: ColorConstants.introPageTextColor),
          ),
        ),
      ],
    );
  }

  Widget _signInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Text(
          'Have an Account?',
          style: GoogleFonts.lato(fontSize: 15),
        )),
        const SizedBox(
          width: 2,
        ),
        Flexible(
            child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, LoginPage.screenName);
          },
          child: Text(
            'Sign In',
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

  TextStyle textStyle() {
    return GoogleFonts.lato(
      color: ColorConstants.introPageTextColor,
      fontSize: size.height * 0.02,
    );
  }

  showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
  }

  String? _nameValidate(String? value) {
    if (value!.isEmpty) {
      return 'please enter name';
    }
    return null;
  }

  void socialLoginEnabled() async {
    http.Response response = await _apiServices.getSocialLogin();
    var data = jsonDecode(response.body);
    String yesOrNo = data["data"];
    if (yesOrNo == 'No') {
      setState(() {
        socialLoginEnable = false;
      });
    } else {
      setState(() {
        socialLoginEnable = true;
      });
    }
  }
}
