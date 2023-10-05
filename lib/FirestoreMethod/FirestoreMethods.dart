import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FireStoreMethod {
  //*********************Medicine Data
  static medicinesData(BuildContext context, String uid,
      List<Map<String, dynamic>> medicineModel) async {
    var snap = await FirebaseFirestore.instance
        .collection('HospitalNames')
        .doc("Delhi Aims")
        .collection("Users")
        .doc("MBD6ejDLY8eaPm1pFLWC9gNaD2E2")
        .collection("Medicines")
        .doc("medi")
        .set({"medicines": medicineModel});
  }

  //*********************Medicine Data
  static exerciseData(BuildContext context, String uid,
      List<Map<String, dynamic>> medicineModel) async {
    var snap = await FirebaseFirestore.instance
        .collection('HospitalNames')
        .doc("Delhi Aims")
        .collection("Users")
        .doc("MBD6ejDLY8eaPm1pFLWC9gNaD2E2")
        .collection("Exercises")
        .doc("excer")
        .set({"exercise": medicineModel});
  }

  static dietPlan(BuildContext context, String uid, List<String> ls) async {
    print("fetching");
    var snap = await FirebaseFirestore.instance
        .collection('HospitalNames')
        .doc("Delhi Aims")
        .collection("Users")
        .doc("MBD6ejDLY8eaPm1pFLWC9gNaD2E2")
        .collection("DietPlan")
        .doc("diet")
        .set({
      "Deitplan": {"eat": ls}
    });
  }
}
