import 'dart:convert';

class Loginuser {
  Loginuser({
    required this.userEmail,
    required this.userPassword,
    required this.onesignalId,
  });

  String userEmail;
  String userPassword;
  String onesignalId;

  factory Loginuser.fromJson(String str) => Loginuser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Loginuser.fromMap(Map<String, dynamic> json) => Loginuser(
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        onesignalId: json["onesignal_id"],
      );

  Map<String, dynamic> toMap() => {
        "user_email": userEmail,
        "user_password": userPassword,
        "onesignal_id": onesignalId,
      };
}
