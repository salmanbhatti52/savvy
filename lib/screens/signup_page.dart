import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
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
  final formKey = GlobalKey<FormState>();

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
                Expanded(flex: 2, child: _signInText()),
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
          'Sign Up',
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
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _addHorizontalSpace(size.width * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SignUpPageTextFeild(
                    controller: _nameController,
                    validator: _nameValidate,
                    hintText: 'Name',
                    autofocus: true,
                    labelText: 'First Name'),
              ),
              Expanded(
                child: SignUpPageTextFeild(
                    controller: _emailController,
                    validator: _emailValidate,
                    hintText: 'enter@example.com',
                    autofocus: false,
                    labelText: 'Enter Email'),
              ),
              Expanded(
                child: SignUpPageTextFeild(
                    controller: _passwordController,
                    validator: _passwordValidate,
                    hintText: '8 chracters',
                    autofocus: false,
                    labelText: 'Password'),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton() {
    return MyButton(
      ontap: () async {
        Response response;
        if (formKey.currentState!.validate()) {
          response = await _apiServices.signUpWithApi(CreateUser(
            onesignalId: "",
            fullName: _nameController.text.toString(),
            userEmail: _emailController.text.toString(),
            userPassword: _passwordController.text.toString(),
            notificationSwitch: "yes",
          ));

          if (response.statusCode == 200 && mounted) {
            Navigator.popAndPushNamed(context, IntroPage.screenName);
          } else {
            throw Exception();
          }
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return signUpFailedAlertDialog('');
            },
          );
        }
      },
      width: size.width * 0.6,
      height: size.height * 0.1,
      radius: size.height * 0.03,
      spreadRadius: 2,
      color: ColorConstants.buttonColor,
      child: Text(
        'Sign Up',
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

  Widget _signInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //  crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'have an account?',
          style: TextStyle(fontSize: size.height * 0.017),
        ),
        GestureDetector(
          onTap: (() {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const LoginPage();
              },
            ));
          }),
          child: Text(
            'Sign In',
            style: GoogleFonts.abel(
                color: ColorConstants.buttonColorLight,
                fontSize: size.height * 0.017),
          ),
        ),
      ],
    );
  }

  Widget signUpFailedAlertDialog(String text) {
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

  String? _nameValidate(String? value) {
    if (value!.isEmpty) {
      return 'please enter text';
    }
    return null;
  }

  String? _emailValidate(String? value) {
    if (value!.isEmpty) {
      return 'please enter email';
    }
    return null;
  }

  String? _passwordValidate(String? value) {
    if (value!.isEmpty) {
      return 'please enter password';
    }
    return null;
  }
}
