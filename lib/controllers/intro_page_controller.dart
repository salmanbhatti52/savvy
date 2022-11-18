import 'package:get/get.dart';

class IntroPageController extends GetxController {
  String userName = '';
  String loggedInUserName = '';

  void setUserName(String name) {
    userName = name;
  }

  String getUserName() {
    return userName;
  }

  void setLoggedInUserName(String loggedInName) {
    loggedInUserName = loggedInName;
  }

  String getLoggedInUserName() {
    return userName;
  }
}
