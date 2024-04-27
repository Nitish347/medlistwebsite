// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? id;
  String? doctorName;
  String? email;
  String? phone;
  String? hospitalName;
  String? address;
  String? gender;
  String? specialization;
  String? about;
  String? verified;
  String? password;
  int? v;
  List<Token>? tokens;

  UserModel({
    this.id,
    this.doctorName,
    this.email,
    this.phone,
    this.hospitalName,
    this.address,
    this.gender,
    this.specialization,
    this.about,
    this.verified,
    this.password,
    this.v,
    this.tokens,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    doctorName: json["DoctorName"],
    email: json["Email"],
    phone: json["Phone"],
    hospitalName: json["HospitalName"],
    address: json["Address"],
    gender: json["Gender"],
    specialization: json["Specialization"],
    about: json["About"],
    verified: json["Verified"],
    password: json["Password"],
    v: json["__v"],
    tokens: json["Tokens"] == null ? [] : List<Token>.from(json["Tokens"]!.map((x) => Token.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "DoctorName": doctorName,
    "Email": email,
    "Phone": phone,
    "HospitalName": hospitalName,
    "Address": address,
    "Gender": gender,
    "Specialization": specialization,
    "About": about,
    "Verified": verified,
    "Password": password,
    "__v": v,
    "Tokens": tokens == null ? [] : List<dynamic>.from(tokens!.map((x) => x.toJson())),
  };
}

class Token {
  String? token;
  String? id;

  Token({
    this.token,
    this.id,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    token: json["token"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "_id": id,
  };
}
