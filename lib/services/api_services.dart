import 'dart:convert';

import 'package:http/http.dart';
import 'package:savvy/models/create_user.dart';
import 'package:savvy/models/login_user.dart';
import 'package:savvy/services/api_urls.dart';

class ApiServices {
  Future<Response> signUpWithApi(CreateUser user) async {
    Response signUpResponse = await post(
      Uri.parse(ApiUrls.endPointSignUp),
      body: jsonEncode({
        "onesignal_id": "1",
        "full_name": user.fullName,
        "user_email": user.userEmail,
        "user_password": user.userPassword,
        "notification_switch": "Yes"
      }),
    );

    return signUpResponse;
  }

  Future<Response> loginWithApi(Loginuser user) async {
    Response loginResponse = await post(
      Uri.parse(ApiUrls.endPointLogin),
      // headers: <String, String>{
      //   "Content-Type": "application/x-www-form-urlencoded"
      // },

      body: jsonEncode(user.toMap()),
    );

    return loginResponse;
  }
}
