import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static final client = http.Client();

  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print(response.body);
    return response.body;
  }

  static Future<String> get(String endpoint) async {
    var token = "hospital";
    // var token = await NetWorkHandler.getToken();
    if (token != null) {
      // print(token);
      var response = await client.get(buildUrl(endpoint), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer {{HospitalToken}}'
      });
      return response.body;
    } else {
      print("token failed to get");
    }

    return jsonEncode({"status": "failed", "msg": "nothing get"});
  }

  static Uri buildUrl(String endpoint) {
    String host = "http://localhost:3000/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }
}
