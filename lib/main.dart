import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Pages/Auth/registerUser.dart';

void main() async {
 await  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAgBIvpegmqYEB0Kn2jClqql4R-VbyGHwE",
            authDomain: "sihapp-2bc87.firebaseapp.com",
            projectId: "sihapp-2bc87",
            storageBucket: "sihapp-2bc87.appspot.com",
            messagingSenderId: "270653334549",
            appId: "1:270653334549:web:1e7f2262c016041102da1c",
            measurementId: "G-63N5YCL6NC"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterUser(),
    );
  }
}
