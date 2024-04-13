import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:medlistweb/models/UserModel.dart';

class SaveUser {
  static saveUser(
    BuildContext context,
    String uid,
      UserModel user
  ) async {
    await FirebaseFirestore.instance
        .collection('HospitalNames')
        .doc(user.hospitalName!)
        .set({
      "DrName": user.doctorName!,
      "HospitalAddress": user.address!,
      "HospitalContact": user.phone!,
      "HospitalName": user.hospitalName!
    });
    await FirebaseFirestore.instance.collection("HospitalsNames").doc(uid).collection("Users");
    await FirebaseFirestore.instance.collection("Hospitals").doc(uid).set({
      "FirstName": user.firstName,
      "LastName": user.lastName,
      "Email": user.email,
      "Phone": user.phone,
      "HospitalName": user.hospitalName,
      "DoctorName": user.doctorName,
      "Address": user.address,
      "Gender": user.gender,
      "Specialization": user.specialization,
      "About": user.about,
      "Password": user.password,
      "uid": uid
    });  

  }
}
