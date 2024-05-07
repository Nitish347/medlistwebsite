import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:medlistweb/Controller/NetworkHandler.dart';
import 'package:medlistweb/Pages/home.dart';
import 'package:medlistweb/models/UserModel.dart';

import '../models/MedicineModel.dart';
import 'SigninController.dart';

class MedicineController extends GetxController {
  postMedicines(MedicineModel medicineModel) async {
    if (medicineModel.medicineName != null) {
      var token = await SigningController.getToken();
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://medlist-shivikatyagi.onrender.com/addingMedicines'));
      request.body = json.encode({
        "id": medicineModel.id,
        "MedicineName": medicineModel.medicineName,
        "TimeTaken": medicineModel.timeTaken.toString(),
        "MealTime": medicineModel.mealTime,
        "Picture": "pic"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } else {
      log('null value');
    }
  }

  deleteAllMedicines(String id) async {
    try {
      var data = json.encode({"patient_id": id});
      var response = await NetworkHandler.auth_post(data, "deleteAllMedicines");
      log(response);
      var data2 = json.decode(response);
    } catch (e) {
      log(e.toString());
    }
  }

  deleteMedicines(String id, String medicineId) async {
    try {
      var data = json.encode({"patient_id": id, "medicine_id": medicineId});
      var response = await NetworkHandler.auth_patch(data, "deleteMedicine");
      log(response);
    } catch (e) {
      log(e.toString());
    }
  }
}
