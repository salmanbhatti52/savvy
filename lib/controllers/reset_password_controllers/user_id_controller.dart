import 'package:get/get.dart';

class UserIdController extends GetxController {
  String userId = '';

  void setUserId(String id) {
    userId = id;
  }

  String getUserId() {
    return userId;
  }
}
