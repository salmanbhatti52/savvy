import 'dart:convert';

class User {
  User({
    this.status,
    required this.data,
  });

  String? status;
  Data data;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
      };
}

class Data {
  Data({
    this.token,
    required this.user,
  });

  String? token;
  UserClass user;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: UserClass.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "user": user.toMap(),
      };
}

class UserClass {
  UserClass({
    required this.usersCustomersId,
    this.onesignalId,
    this.fullName,
    this.userEmail,
    this.userPassword,
    this.notificationSwitch,
    this.resetOtp,
    required this.createdAt,
    required this.updatedAt,
    this.status,
  });

  String usersCustomersId;
  String? onesignalId;
  String? fullName;
  String? userEmail;
  String? userPassword;
  String? notificationSwitch;
  dynamic resetOtp;
  DateTime createdAt;
  DateTime updatedAt;
  String? status;

  factory UserClass.fromJson(String str) => UserClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserClass.fromMap(Map<String, dynamic> json) => UserClass(
        usersCustomersId: json["users_customers_id"],
        onesignalId: json["onesignal_id"],
        fullName: json["full_name"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        notificationSwitch: json["notification_switch"],
        resetOtp: json["reset_otp"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "users_customers_id": usersCustomersId,
        "onesignal_id": onesignalId,
        "full_name": fullName,
        "user_email": userEmail,
        "user_password": userPassword,
        "notification_switch": notificationSwitch,
        "reset_otp": resetOtp,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
      };
}
