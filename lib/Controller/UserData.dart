import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:medlistweb/Controller/NetworkHandler.dart';
import 'package:medlistweb/Pages/home.dart';
import 'package:medlistweb/models/UserModel.dart';

class UserData extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;

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

  // ****************************************REQUESTS*******************************************************
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

}
