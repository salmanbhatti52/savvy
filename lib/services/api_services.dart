import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:savvy/models/create_user.dart';
import 'package:savvy/models/login_user.dart';
import 'package:savvy/models/sdgs_models/sdgs_list.dart';
import 'package:savvy/models/user.dart';
import 'package:savvy/services/api_urls.dart';

class ApiServices {
  Future<Response> signUpWithApi(CreateUser user) async {
    Response signUpResponse = await post(
      Uri.parse(ApiUrls.endPointSignUp),
      body: jsonEncode(user.toMap()),
    );

    return signUpResponse;
  }

  Future<Response> loginWithApi(Loginuser user) async {
    Response loginResponse = await post(
      Uri.parse(ApiUrls.endPointLogin),
      body: jsonEncode(user.toMap()),
    );

    return loginResponse;
  }

  Future<Response> updateUSerWithApi(User? user, CreateUser updated) async {
    String id = user!.data.user.usersCustomersId.toString();
    //  debugPrint("${id}at api services");
    Response response = await put(
      Uri.parse(ApiUrls.endPointUpdate + id),
      body: jsonEncode(updated.toMap()),
    );

    return response;
  }

  Future<Response> getOtpWithApi(String email) async {
    Response response = await post(Uri.parse(ApiUrls.endPointGetOtp),
        body: jsonEncode({"user_email": email}));
    return response;
  }

  Future<Response> resetPasswordWithApi(
      String id, otp, newpassword, confirmpassword) async {
    Response response = await post(Uri.parse(ApiUrls.endPointChangePassword),
        body: jsonEncode({
          "users_customers_id": id,
          "otp": otp,
          "new_password": newpassword,
          "confirm_password": confirmpassword
        }));
    return response;
  }

  Future<Response> calculatePlan(
      String years, initialInvestmet, permonthInvestment) async {
    Response response = await post(Uri.parse(ApiUrls.endPointCalculator),
        body: jsonEncode({
          "years": years,
          "initial_investment": initialInvestmet,
          "permonth_investment": permonthInvestment
        }));
    debugPrint('create Plan Body APi');
    // var data = jsonDecode(response.body);
    // Investment investment = Investment.fromMap(data);
    // var withSavy = investment.data[1].co2;

    // debugPrint(withSavy);

    return response;
  }

  Future<List<SdgsList>> getAllSdgs() async {
    Response response = await get(Uri.parse(ApiUrls.endPointGetAllSdgs));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<SdgsList> list = [];
      for (int i = 0; i <= 16; i++) {
        var item = SdgsList.fromMap(data["data"][i]);
        list.add(item);
      }
      return list;
    } else {
      throw Exception();
    }
  }
}
