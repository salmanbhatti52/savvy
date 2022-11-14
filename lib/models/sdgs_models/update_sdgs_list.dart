import 'dart:convert';

class UpdatedSdgsList {
  UpdatedSdgsList({
    required this.systemSdgsId,
    required this.title,
    required this.description,
    required this.colorCode,
    required this.image,
    required this.status,
  });

  final String systemSdgsId;
  final String title;
  final String description;
  final String colorCode;
  final String image;
  final String status;

  factory UpdatedSdgsList.fromJson(String str) =>
      UpdatedSdgsList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatedSdgsList.fromMap(Map<String, dynamic> json) => UpdatedSdgsList(
        systemSdgsId: json["system_sdgs_id"],
        title: json["title"],
        description: json["description"],
        colorCode: json["color_code"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "system_sdgs_id": systemSdgsId,
        "title": title,
        "description": description,
        "color_code": colorCode,
        "image": image,
        "status": status,
      };
}
