import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:savvy/common/widgets/update_textfeilds.dart';
import 'package:savvy/models/create_user.dart';
import 'package:savvy/models/user.dart';
import 'package:savvy/services/api_services.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: UpdateTextFeild(
                    
                    controller: _nameController,
                    hintText: 'Enter name',
                    autofocus: false,
                    labelText: 'name'),
              ),
              addVerticalSpace(size),
              Flexible(
                child: UpdateTextFeild(
                    controller: _emailController,
                    hintText: 'Enter Email',
                    autofocus: false,
                    labelText: 'Email'),
              ),
              addVerticalSpace(size),
              Flexible(
                child: UpdateTextFeild(
                    controller: _passwordController,
                    hintText: 'Enter Password',
                    autofocus: false,
                    labelText: 'password'),
              ),
              addVerticalSpace(size),
              Flexible(
                  child: ElevatedButton(
                onPressed: () async {
                  Response response = await _apiServices.updateUSerWithApi(
                      widget.user,
                      CreateUser(
                          onesignalId: "",
                          fullName: _nameController.text,
                          userEmail: _emailController.text,
                          userPassword: _passwordController.text,
                          notificationSwitch: "yes"));

                  if (response.statusCode == 200 && mounted) {
                    Navigator.pop(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return updateFailedAlertDialog(
                            response.body.toString());
                      },
                    );
                  }

                  // debugPrint(ApiUrls.endPointUpdate + id);
                },
                child: const Text('Update'),
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
}
