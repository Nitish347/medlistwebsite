import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();

  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    log(response.body);
    return response.body;
  }

  static Future<String> get(String endpoint) async {
    var token = "hospital";
    if (token != null) {
      var response = await client.get(buildUrl(endpoint), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer {{HospitalToken}}'
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
  static Future<void> storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }
  static Future<String?> getToken() async {
    return await storage.read(key: "token");
  }

  static Future<String?> removeToken() async {
    await storage.deleteAll();

    if (await storage.read(key: "token") == null) {
      // Get.offAllNamed(Routes.LOGIN);
    } else {
      log("Failed to empty storage");
    }
    return null;
  }
}
