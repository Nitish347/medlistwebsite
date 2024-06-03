// To parse this JSON data, do
//
//     final exersisePostModel = exersisePostModelFromJson(jsonString);

import 'dart:convert';

ExersisePostModel exersisePostModelFromJson(String str) => ExersisePostModel.fromJson(json.decode(str));

String exersisePostModelToJson(ExersisePostModel data) => json.encode(data.toJson());

class ExersisePostModel {
  String? id;
  String? description;
  DateTime? timeTaken;

  ExersisePostModel({
    this.id,
    this.description,
    this.timeTaken,
  });

  factory ExersisePostModel.fromJson(Map<String, dynamic> json) => ExersisePostModel(
    id: json["id"],
    description: json["Description"],
    timeTaken: json["TimeTaken"] == null ? null : DateTime.parse(json["TimeTaken"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Description": description,
    "TimeTaken": timeTaken?.toIso8601String(),
  };
}

