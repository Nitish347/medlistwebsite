// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? hospitalName;
  String? doctorName;
  String? address;
  String? gender;
  String? specialization;
  String? about;
  String? password;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.hospitalName,
    this.doctorName,
    this.address,
    this.gender,
    this.specialization,
    this.about,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["FirstName"],
        lastName: json["LastName"],
        email: json["Email"],
        phone: json["Phone"],
        hospitalName: json["HospitalName"],
        doctorName: json["DoctorName"],
        address: json["Address"],
        gender: json["Gender"],
        specialization: json["Specialization"],
        about: json["About"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "Phone": phone,
        "HospitalName": hospitalName,
        "DoctorName": doctorName,
        "Address": address,
        "Gender": gender,
        "Specialization": specialization,
        "About": about,
        "Password": password,
      };
}
