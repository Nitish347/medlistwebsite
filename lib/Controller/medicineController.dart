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

class MedicineController extends GetxController {

    postMedicines(MedicineModel medicineModel)async{
      try{
        Map<String, dynamic> mp;
        mp  = medicineModel.toJson();
        var data = json.encode(mp);
        var response = await NetworkHandler.auth_post(data, "addingMedicines");
        log(response);
      }catch(e){
        log(e.toString());
      }
    }

    deleteAllMedicines(String id)async{
      try{
        var data = json.encode({
            "patient_id" :id
        });
        var response = await NetworkHandler.auth_post(data, "deleteAllMedicines");
        log(response);
        var data2 = json.decode(response);
      }catch(e){
        log(e.toString());
      }
    }

    deleteMedicines(String id, String medicineId)async{
      try{
        var data = json.encode({
          "patient_id" :id,
          "medicine_id": medicineId
        });
        var response = await NetworkHandler.auth_patch(data, "deleteMedicine");
        log(response);
      }catch(e){
        log(e.toString());
      }
    }

}
