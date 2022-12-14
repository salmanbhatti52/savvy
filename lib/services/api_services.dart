import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:savvy/models/create_user.dart';
import 'package:savvy/models/login_user.dart';
import 'package:savvy/models/sdgs_models/update_sdgs_list.dart';
import 'package:savvy/models/user.dart';
import 'package:savvy/services/api_urls.dart';

import '../models/get_blogs_model.dart';

class ApiServices {
  Future<http.Response> signUpWithApi(CreateUser user) async {
    print('Sign up with api body');
    http.Response signUpResponse = await http.post(
      Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointSignUp),
      body: jsonEncode(user.toMap()),
    );
    return signUpResponse;
  }

  Future<http.Response> loginWithApi(Loginuser user) async {
    http.Response loginResponse = await http.post(
      Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointLogin),
      body: jsonEncode(user.toMap()),
    );
    return loginResponse;
  }

  Future<http.Response> updateUSerWithApi(
      User? user, CreateUser updated) async {
    String id = user!.data.user.usersCustomersId.toString();
    //  debugPrint("${id}at api services");
    http.Response response = await http.put(
      Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointUpdate + id),
      body: jsonEncode(updated.toMap()),
    );
    return response;
  }

  Future<http.Response> getOtpWithApi(String email) async {
    print('otp with api body');
    http.Response response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointGetOtp),
        body: jsonEncode({"user_email": email}));
    print(response.statusCode.toString());
    return response;
  }

  Future<http.Response> resetPasswordWithApi(
      String id, otp, newPassword, confirmPassword) async {
    http.Response response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointChangePassword),
        body: jsonEncode({
          "users_customers_id": id,
          "otp": otp,
          "new_password": newPassword,
          "confirm_password": confirmPassword
        }));
    return response;
  }

  Future<http.Response> calculatePlan(
      String years, initialInvestment, permonthInvestment) async {
    http.Response response =
        await http.post(Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointCalculator),
            body: jsonEncode({
              "years": years,
              "initial_investment": initialInvestment,
              "permonth_investment": permonthInvestment
            }));
    debugPrint('create Plan Body APi');
    return response;
  }

  Future<List<UpdatedSdgsList>> getAllSdgs() async {
    http.Response response = await http.get(Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointGetAllSdgs));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<UpdatedSdgsList> list = [];
      for (int i = 0; i <= 16; i++) {
        var item = UpdatedSdgsList.fromJson(data["data"][i]);
        list.add(item);
      }
      return list;
    } else {
      throw Exception();
    }
  }

  Future<http.Response> getSocialLogin() async {
    http.Response response = await http
        .get(Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointSocialLogin));
    return response;
  }

}
