import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:medlistweb/Controller/NetworkHandler.dart';
import 'package:medlistweb/Pages/home.dart';
import 'package:medlistweb/constants/constants.dart';
import 'package:medlistweb/models/UserModel.dart';

import '../models/MedicineModel.dart';
import 'SigninController.dart';

class MedicineController extends GetxController {
  postMedicines(MedicineModel medicineModel) async {
    if (medicineModel.medicineName != null) {
      final url = Uri.parse('https://medlist-shivikatyagi.onrender.com/addingMedicines');
      final Map<String, dynamic> body = {
        "id": medicineModel.id,
        "MedicineName": medicineModel.medicineName,
        "TimeTaken":  medicineModel.timeTaken.toString(),
        "MealTime": medicineModel.medicineName,
        "Picture": "kasjkfdkmscdn"
      };
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken'

        },
        body: json.encode(body),
      );

      if (response.statusCode == 201) {
        print('Medicine data posted successfully!');
        print(response.body);
      } else {
        print('Failed to post medicine data. Status code: ${response.statusCode}');
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
