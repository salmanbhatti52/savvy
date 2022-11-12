import 'dart:convert';

class SdgsList {
  SdgsList({
    required this.systemSdgsId,
    required this.title,
    required this.description,
    required this.colorCode,
    required this.status,
  });

  final String systemSdgsId;
  final String title;
  final String description;
  final String colorCode;
  final String status;

  factory SdgsList.fromJson(String str) => SdgsList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SdgsList.fromMap(Map<String, dynamic> json) => SdgsList(
        systemSdgsId: json["system_sdgs_id"],
        title: json["title"],
        description: json["description"],
        colorCode: json["color_code"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "system_sdgs_id": systemSdgsId,
        "title": title,
        "description": description,
        "color_code": colorCode,
        "status": status,
      };
}
