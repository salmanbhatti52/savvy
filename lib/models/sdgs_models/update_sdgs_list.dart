import 'dart:convert';

// class UpdatedSdgsList {
//   final String systemSdgsId;
//   final String title;
//   final String description;
//   final String colorCode;
//   final String image;
//   final String status;
//
//   UpdatedSdgsList({
//     required this.systemSdgsId,
//     required this.title,
//     required this.description,
//     required this.colorCode,
//     required this.image,
//     required this.status,
//   });
//
//   factory UpdatedSdgsList.fromJson(String str) =>
//       UpdatedSdgsList.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory UpdatedSdgsList.fromMap(Map<String, dynamic> json) => UpdatedSdgsList(
//         systemSdgsId: json["system_sdgs_id"],
//         title: json["title"],
//         description: json["description"],
//         colorCode: json["color_code"],
//         image: json["image"],
//         status: json["status"],
//       );
//
//   Map<String, dynamic> toMap() => {
//         "system_sdgs_id": systemSdgsId,
//         "title": title,
//         "description": description,
//         "color_code": colorCode,
//         "image": image,
//         "status": status,
//       };
// }

class UpdatedSdgsList {
  String? systemSdgsId;
  String? title;
  String? description;
  String? colorCode;
  String? performanceThisYear;
  String? performanceReturns;
  String? performanceAnnual;
  String? image;
  String? document;
  String? status;

  UpdatedSdgsList(
      {this.systemSdgsId,
        this.title,
        this.description,
        this.colorCode,
        this.performanceThisYear,
        this.performanceReturns,
        this.performanceAnnual,
        this.image,
        this.document,
        this.status});

  UpdatedSdgsList.fromJson(Map<String, dynamic> json) {
    systemSdgsId = json['system_sdgs_id'];
    title = json['title'];
    description = json['description'];
    colorCode = json['color_code'];
    performanceThisYear = json['performance_this_year'];
    performanceReturns = json['performance_returns'];
    performanceAnnual = json['performance_annual'];
    image = json['image'];
    document = json['document'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['system_sdgs_id'] = this.systemSdgsId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['color_code'] = this.colorCode;
    data['performance_this_year'] = this.performanceThisYear;
    data['performance_returns'] = this.performanceReturns;
    data['performance_annual'] = this.performanceAnnual;
    data['image'] = this.image;
    data['document'] = this.document;
    data['status'] = this.status;
    return data;
  }
}



