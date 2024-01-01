import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Pages/Auth/registerUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            storageBucket: "medlist-bc347.appspot.com",
            apiKey: "AIzaSyBO1anoaUMW1cBgNEtSmbKtYR2DhL75bH8",
            appId: "1:335430665006:web:69fdd0ee32d9566195f0bf",
            messagingSenderId: "335430665006",
            projectId: "medlist-bc347"));
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
