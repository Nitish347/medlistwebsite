import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medlistweb/Controller/NetworkHandler.dart';

class AuthHandler {
  void register(
    var body,
  ) async {
    var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer {{HospitalToken}}'};
    var request = http.Request(
        'POST', Uri.parse('https://medlist-shivikatyagi.onrender.com/Create_Hospital'));
    request.body = json.encode({
      "FirstName": "Shivika",
      "LastName": "Tyagi",
      "Email": "iamshivikatyagi@gmail.com",
      "Phone": "+919760814509",
      "HospitalName": "AIMS",
      "DoctorName": "shivika",
      "Address": "Delhi",
      "Gender": "+919760814509",
      "Specialization": "cardiologist",
      "About": "hiii hellooo",
      "Password": "123456789"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
