import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Pages/Auth/registerUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            storageBucket: "medlistweb.appspot.com",
            apiKey: "AIzaSyB27Gw2eXab4uImPWIDfqOATWtixlPfzCw",
            appId: "1:1038374340019:web:fbe8c67290f2334864b7c6",
            messagingSenderId: "1038374340019",
            projectId: "medlistweb"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterUser(),
    );
  }
}
