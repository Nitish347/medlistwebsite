import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medlistweb/Pages/Auth/LoginPage.dart';
import 'package:medlistweb/routes/app_pages.dart';

import 'HomePage.dart';
import 'Pages/Auth/loginUser.dart';
import 'Pages/Auth/registerUser.dart';
import 'Pages/home.dart';

void main() async {
 await  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBO1anoaUMW1cBgNEtSmbKtYR2DhL75bH8",
            authDomain: "medlist-bc347.firebaseapp.com",
            projectId: "medlist-bc347",
            storageBucket: "medlist-bc347.appspot.com",
            messagingSenderId: "335430665006",
            appId: "1:335430665006:web:5c088345d73197c495f0bf",
            measurementId: "G-JSP1N46XDW"

        ));
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
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.active) {
      //         if (snapshot.hasData) {
      //           return HomeScreen();
      //         } else if (snapshot.hasError) {
      //           return Center(
      //             child: Text("${snapshot.error}"),
      //           );
      //         }
      //       }
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //       return HomePage();
      //     }),
    );
  }
}
