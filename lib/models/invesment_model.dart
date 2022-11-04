// To parse this JSON data, do
//
//     final investment = investmentFromMap(jsonString);

import 'dart:convert';

class Investment {
  Investment({
    this.status,
    required this.data,
  });

  String? status;
  List<Years> data;

  factory Investment.fromJson(String str) =>
      Investment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Investment.fromMap(Map<String, dynamic> json) => Investment(
        status: json["status"],
        data: List<Years>.from(json["data"].map((x) => Years.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Years {
  Years({
    required this.year,
    required this.withSavvy,
    required this.co2,
    required this.waste,
    required this.electricity,
  });

  String year;
  String withSavvy;
  String co2;
  String waste;
  String electricity;

  factory Years.fromJson(String str) => Years.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Years.fromMap(Map<String, dynamic> json) => Years(
        year: json["year"],
        withSavvy: json["with_savvy"],
        co2: json["co2"],
        waste: json["waste"],
        electricity: json["electricity"],
      );

  Map<String, dynamic> toMap() => {
        "year": year,
        "with_savvy": withSavvy,
        "co2": co2,
        "waste": waste,
        "electricity": electricity,
      };
}
