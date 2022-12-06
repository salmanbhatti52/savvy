// // To parse this JSON data, do
// //
// //     final gteBlogsModel = gteBlogsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GteBlogsModel gteBlogsModelFromJson(String str) => GteBlogsModel.fromJson(json.decode(str));
//
// String gteBlogsModelToJson(GteBlogsModel data) => json.encode(data.toJson());
//
// class GteBlogsModel {
//   GteBlogsModel({
//     this.status,
//     this.data,
//   });
//
//   String? status;
//   List<Datum>? data;
//
//   factory GteBlogsModel.fromJson(Map<String, dynamic> json) => GteBlogsModel(
//     status: json["status"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//   };
// }
//
// class Datum {
//   Datum({
//     this.blogsId,
//     this.blogsCategoryId,
//     this.title,
//     this.description,
//     this.author,
//     this.image,
//     this.dateAdded,
//     this.dateModified,
//     this.status,
//     this.category,
//   });
//
//   String? blogsId;
//   String? blogsCategoryId;
//   String? title;
//   String? description;
//   String? author;
//   String? image;
//   DateTime? dateAdded;
//   DateTime? dateModified;
//   String? status;
//   String? category;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     blogsId: json["blogs_id"],
//     blogsCategoryId: json["blogs_category_id"],
//     title: json["title"],
//     description: json["description"],
//     author: json["author"],
//     image: json["image"],
//     dateAdded: DateTime.parse(json["date_added"]),
//     dateModified: DateTime.parse(json["date_modified"]),
//     status: json["status"],
//     category: json["category"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "blogs_id": blogsId,
//     "blogs_category_id": blogsCategoryId,
//     "title": title,
//     "description": description,
//     "author": author,
//     "image": image,
//     "date_added": dateAdded!.toIso8601String(),
//     "date_modified": dateModified!.toIso8601String(),
//     "status": status,
//     "category": category,
//   };
// }

class GteBlogsModel {
  String? blogsId;
  String? blogsCategoryId;
  String? title;
  String? description;
  String? author;
  String? image;
  String? dateAdded;
  String? dateModified;
  String? status;
  String? category;

  GteBlogsModel(
      {this.blogsId,
        this.blogsCategoryId,
        this.title,
        this.description,
        this.author,
        this.image,
        this.dateAdded,
        this.dateModified,
        this.status,
        this.category});

  GteBlogsModel.fromJson(Map<String, dynamic> json) {
    blogsId = json['blogs_id'];
    blogsCategoryId = json['blogs_category_id'];
    title = json['title'];
    description = json['description'];
    author = json['author'];
    image = json['image'];
    dateAdded = json['date_added'];
    dateModified = json['date_modified'];
    status = json['status'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blogs_id'] = this.blogsId;
    data['blogs_category_id'] = this.blogsCategoryId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['author'] = this.author;
    data['image'] = this.image;
    data['date_added'] = this.dateAdded;
    data['date_modified'] = this.dateModified;
    data['status'] = this.status;
    data['category'] = this.category;
    return data;
  }
}