import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:medlistweb/Controller/NetworkHandler.dart';

class SigninController extends GetxController {
  static final client = http.Client();
  static signin(var data) async {
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

  static otpVerify(String otp, String id) async {
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
}
