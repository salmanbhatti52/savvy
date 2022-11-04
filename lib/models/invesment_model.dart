// To parse this JSON data, do
//
//     final investment = investmentFromMap(jsonString);

import 'dart:convert';

class Investment {
  Investment({
    required this.status,
    required this.data,
  });

  String? status;
  Map<String, Year> data;

  Investment copyWith({
    String? status,
    required Map<String, Year> data,
  }) =>
      Investment(
        status: status,
        data: data,
      );

  factory Investment.fromJson(String str) =>
      Investment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Investment.fromMap(Map<String, dynamic> json) => Investment(
        status: json["status"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, Year>(k, Year.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": Map.from(data)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}

class Year {
  Year({
    required this.withSavvy,
    required this.co2,
    required this.waste,
    required this.electricity,
  });

  String withSavvy;
  String co2;
  String waste;
  String electricity;

  Year copyWith({
    required String withSavvy,
    required String co2,
    required String waste,
    required String electricity,
  }) =>
      Year(
        withSavvy: withSavvy,
        co2: co2,
        waste: waste,
        electricity: electricity,
      );

  factory Year.fromJson(String str) => Year.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Year.fromMap(Map<String, dynamic> json) => Year(
        withSavvy: json["with_savvy"],
        co2: json["co2"],
        waste: json["waste"],
        electricity: json["electricity"],
      );

  Map<String, dynamic> toMap() => {
        "with_savvy": withSavvy,
        "co2": co2,
        "waste": waste,
        "electricity": electricity,
      };
}
