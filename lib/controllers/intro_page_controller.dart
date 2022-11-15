import 'package:get/get.dart';

class IntroPageController extends GetxController {
  String userName = '';

  void setUserName(String name) {
    userName = name;
  }

  String getUserName() {
    return userName;
  }
}
