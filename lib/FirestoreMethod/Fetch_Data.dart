import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlistweb/models/UserModel.dart';

import '../OBSdata.dart';

class Fetch{

  static fetchUser( String uid) async {
    final controller = Get.put(ObsData());
    var snp =
    await FirebaseFirestore.instance.collection("Hospitals").doc(uid).get();
    // String hsptlName = snp.data()!["HospitalName"];
    // print(hsptlName);
    // print(snp.data()!["name"]);
    UserModel _user = UserModel.fromJson(snp.data()!);
    controller.user.value = _user;
    print(_user.hospitalName);
  }
}