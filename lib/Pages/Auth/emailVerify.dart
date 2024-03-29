import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:medlistweb/FirestoreMethod/authMedthods.dart';
import 'package:medlistweb/Pages/Auth/registerUser.dart';
import 'package:medlistweb/Pages/home.dart';
import 'package:pinput/pinput.dart';

import '../../models/UserModel.dart';

class EmailVerifyPage extends StatefulWidget {
  UserModel user;
  EmailVerifyPage({required this.user});
  @override
  State<EmailVerifyPage> createState() => _EmailVerifyPageState();
}

class _EmailVerifyPageState extends State<EmailVerifyPage> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    print('verifying');
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      print("verified");
      // TODO: implement your code after email verification
      Get.to(HomeScreen());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email Successfully Verified")));

      timer?.cancel();
    }
  }

  String _otp = "";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      body: Container(
          height: height,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Verify Email',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        "Verification link send to your email",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                            fontSize: width * 0.012),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.user.email!,
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.013),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Image.network(
                "https://static.vecteezy.com/system/resources/previews/010/314/328/original/3d-character-male-doctor-illustration-png.png",
                width: width * 0.21,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            blurRadius: 10.0,
                          ),
                          BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              offset: Offset(4.0, 4.0),
                              blurRadius: 10.0)
                        ],
                        // border: Border.all(
                        //     // color: Colors.green,
                        //     ),
                        borderRadius: BorderRadius.circular(8)),
                    width: width >= 800 ? width * 0.32 : width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(38),
                                  topLeft: Radius.circular(38),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/medlist.png",
                                      height: height * 0.1,
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    Center(
                                      child: LoadingAnimationWidget.bouncingBall(
                                          color: Colors.green, size: height * 0.1),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
