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
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWY1YTFkNTQ0Y2I4NjExZDRmNmE2Y2EiLCJpYXQiOjE3MTQ5MTczMjV9.7xfs79jk0SGB5NlXQXWZnN3Z5npHpH5yuzKXQvkXAJA'
      };
      var request = http.Request('POST', Uri.parse('https://medlist-shivikatyagi.onrender.com/addingMedicines'));
      request.body = json.encode({
        "id": "6605a12e76fcd0c4e80a6648",
        "MedicineName": "paracdfhbdfbhdfetamol",
        "TimeTaken": DateTime.now(),
        "MealTime": "njkn",
        "Picture": "kasjkfdkmscdn"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }

      // medicineModel.picture = "abcd";
      // try{
      //   Map<String, dynamic> mp;
      //
      //   mp  = medicineModel.toJson();
      //   print(mp.toString());
      //   var data = json.encode({
      //     "id":"6605a12e76fcd0c4e80a6648",
      //     "MedicineName":"paracdfhbdfbhdfetamol",
      //     "TimeTaken":"2040-10-28T01:00:00Z",
      //     "MealTime":"njkn",
      //     "Picture":"kasjkfdkmscdn"
      //   });
      //   var response = await NetworkHandler.auth_post(data, "addingMedicines");
      //   log("post medicine-->$response");
      // }catch(e){
      //   log(e.toString());
      // }
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
