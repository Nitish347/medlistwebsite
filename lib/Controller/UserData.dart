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
  List<AppointmentModel> appointmentDoneList = <AppointmentModel>[].obs;

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

  getAppointment()async{
    appointmentList.clear();
    var token = await SigningController.getToken();
    var headers = {
      'Content-Type': 'application/json',
              'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWY1YTFkNTQ0Y2I4NjExZDRmNmE2Y2EiLCJpYXQiOjE3MTYxMDgzNzF9.QI3S_XfpQCsZ_oFNL9XYN-DYk39Pk5QT_IjekuypDqI'
    };
    var request = http.Request('GET', Uri.parse('https://medlist-shivikatyagi.onrender.com/appointment/left?date=04-06-2024'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    // var data = json.decode(response.stream.toString());
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var appointments = json.decode(data.toString());
      log("---------->>>>>>>>>>"+appointments.toString());
      for( var i in appointments){
        AppointmentModel appointmentModel = AppointmentModel.fromJson(i);
        appointmentList.add(appointmentModel);
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }
  // ****************************************GET APPOINTMENTS DONE *******************************************************

  getAppointmnetDone()async{
    appointmentDoneList.clear();
    var token = await SigningController.getToken();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse('https://medlist-shivikatyagi.onrender.com/appointment/done?date=24-03-2002'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    // var data = json.decode(response.stream.toString());
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var appointments = json.decode(data.toString());
      log(appointments.toString());
      for( var i in appointments){
        AppointmentModel appointmentModel = AppointmentModel.fromJson(i);
        appointmentDoneList.add(appointmentModel);
      }
    }
    else {
      print(response.reasonPhrase);
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
