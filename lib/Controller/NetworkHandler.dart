import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:medlistweb/Controller/SigninController.dart';

class NetworkHandler {
  static final client = http.Client();


  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    log(response.body);
    return response.body;
  }

  static Future<String> get(String endpoint) async {
    var token = await SigninController.getToken();
    log( "token->$token");
    if (token != null) {
      var response = await client.get(buildUrl(endpoint), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      });
      return response.body;
    } else {
      log("token failed to get");
    }
    return jsonEncode({"status": "failed", "msg": "nothing get"});
  }
  static Uri buildUrl(String endpoint) {
    String host = "https://medlist-shivikatyagi.onrender.com/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

}
