// To parse this JSON data, do
//
//     final eat = eatFromJson(jsonString);

import 'dart:convert';

Eat eatFromJson(String str) => Eat.fromJson(json.decode(str));

String eatToJson(Eat data) => json.encode(data.toJson());

class Eat {
  String? id;
  String? d;

  Eat({
    this.id,
    this.d,
  });

  factory Eat.fromJson(Map<String, dynamic> json) => Eat(
    id: json["id"],
    d: json["d"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "d": d,
  };
}
