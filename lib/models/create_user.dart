import 'dart:convert';

class CreateUser {
  CreateUser({
    this.onesignalId,
    required this.firstName,
    required this.lastName,
    required this.userEmail,
    required this.userPassword,
    this.notificationSwitch,
  });

  String? onesignalId;
  String firstName;
  String lastName;
  String userEmail;
  String userPassword;
  String? notificationSwitch;

  factory CreateUser.fromJson(String str) =>
      CreateUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateUser.fromMap(Map<String, dynamic> json) => CreateUser(
        onesignalId: json["onesignal_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        notificationSwitch: json["notification_switch"],
      );

  Map<String, dynamic> toMap() => {
        "onesignal_id": onesignalId,
        "first_name": firstName,
        "last_name": lastName,
        "user_email": userEmail,
        "user_password": userPassword,
        "notification_switch": notificationSwitch,
      };
}
