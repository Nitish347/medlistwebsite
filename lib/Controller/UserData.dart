import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:medlistweb/Controller/NetworkHandler.dart';
import 'package:medlistweb/Controller/SigninController.dart';
import 'package:medlistweb/Pages/home.dart';
import 'package:medlistweb/models/UserModel.dart';
import 'package:medlistweb/models/appointmentModel.dart';

class UserData extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;
  List<AppointmentModel> appointmentList = <AppointmentModel>[].obs;

  // ************************************USER DETAIL***********************************************************
  getUser()async{
    try{
      var response = await NetworkHandler.get("hospitalDetail");
      if(response != null){

        var data  = json.decode(response);
        log(data.toString());
        userModel.value = UserModel.fromJson(data);
      }
    }catch(e){
      log(e.toString());
    }
  }

  // ****************************************GET REQUESTS*******************************************************
  getRequests()async{
    try{
      var response = await NetworkHandler.get("nonVerifiedPatient");
      if(response != null){

        var data  = json.decode(response);
        log(data.toString());
        userModel.value = UserModel.fromJson(data);
      }
    }catch(e){
      log(e.toString());
    }
  }

  // ****************************************GET APPOINTMENTS*******************************************************
  getAppointmnet()async{
    DateTime dateTime = DateTime.now();
    String dateTimeString = dateTime.toString();
    DateTime dateTime1 = DateTime.parse(dateTimeString);

    // Formatting the date in the desired format
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(dateTime);
    formattedDate = "24-03-2002";

    try{
      var response = await NetworkHandler.get("appointment/left?date=24-03-2002");
      var data  = json.decode(response);
      log("appointment-->$data");
      for(var i in data){
        AppointmentModel appointmentModel  =  AppointmentModel.fromJson(i);
        appointmentList.add(appointmentModel);
      }
        }catch(e){
      log(e.toString());
    }
  }

  // ****************************************VERIFY REQUESTS**************************************************
  verifyRequests(String id)async{
    try{
      var data = json.encode({
        "id":id
      });
      var response = await NetworkHandler.auth_post(data, "verifyingPatient");
      log(response);
    }catch(e){
      log(e.toString());
    }
  }

}
