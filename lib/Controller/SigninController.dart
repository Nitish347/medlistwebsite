import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:medlistweb/Controller/NetworkHandler.dart';

class SigninController extends GetxController {

  static final client = http.Client();
   signin(var data) async {
    log(data.toString());
    data = jsonEncode(data);
    try {
      var response = await NetworkHandler.post(data, "Create_Hospital");
      log(response);
      return jsonDecode(response);
    } catch (e) {
      log(e.toString());
    }
  }

   otpVerify(String otp, String id) async {
    log(otp.toString());
    var data = jsonEncode({"otp": otp});
    try {
      var response = await NetworkHandler.post(data, "VerifyEmail?id=$id");
      log(response);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

   login(String email, String otp)async{
     log(email);
     log(otp);
    try{
      var data = json.encode({
          "Email" : email,
          "Password" : otp
      });
      var response = await NetworkHandler.post(data, "login_Hospital");
      log(response);
      var data2 = json.decode(response);
      NetworkHandler.storeToken(data2["token"]);
    }catch(e){
      log(e.toString());
    }
  }
}
