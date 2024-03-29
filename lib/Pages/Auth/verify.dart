import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medlistweb/Controller/SigninController.dart';
import 'package:medlistweb/Pages/home.dart';
import 'package:pinput/pinput.dart';

import '../../models/UserModel.dart';

class VerifyPage extends StatefulWidget {
  String id;
  UserModel user;
  VerifyPage({required this.user, required this.id});
  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool register = false;
  changeR() {
    setState(() {
      register = true;
    });
  }

  void changeS() {
    setState(() {
      register = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // sendOTP("PhoneNumber");
  }

  String _otp = "";
  bool _loading = false;
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
                        'Verify OTP',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        "OTP sent to the Phone Number",
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
                            "8840867665",
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
                              decoration: const BoxDecoration(
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
                                    Text(
                                      "Enter OTP Here",
                                      style: GoogleFonts.montserrat(
                                          fontSize: height * 0.021, color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Container(
                                      height: height * 0.1,
                                      width: width,
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: width,
                                            alignment: Alignment.center,
                                            child: Pinput(
                                              length: 4,
                                              defaultPinTheme: PinTheme(
                                                  width: height * 0.06,
                                                  height: height * 0.06,
                                                  textStyle: const TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w400),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green.withOpacity(0.2),
                                                    borderRadius: BorderRadius.circular(8),
                                                  )),
                                              pinputAutovalidateMode:
                                                  PinputAutovalidateMode.onSubmit,
                                              showCursor: true,
                                              keyboardType: TextInputType.number,
                                              scrollPadding: EdgeInsets.only(bottom: 140),
                                              autofocus: true,
                                              closeKeyboardWhenCompleted: false,
                                              onChanged: (val) {
                                                print(val.toString());
                                                setState(() {
                                                  _otp = val.toString();
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Container(
                                      width: width,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Don’t receive the OTP?".tr,
                                            style: GoogleFonts.montserrat(
                                                fontSize: height * 0.016,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            " Resend".tr,
                                            style: GoogleFonts.montserrat(
                                                fontSize: height * 0.016,
                                                fontWeight: FontWeight.w600,
                                                decoration: TextDecoration.underline,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (_otp.isNotEmpty && _otp.length == 4) {
                                          setState(() {
                                            _loading = true;
                                          });
                                          var data =
                                              await SigninController.otpVerify(_otp, widget.id);
                                          setState(() {
                                            _loading = false;
                                          });
                                          if (data == "email verified") {
                                            Get.to(() => HomeScreen());
                                          }
                                        }
                                        // verifycode(_otp, context);
                                      },
                                      // onTap: () => Get.to(ChangePinScreen()),
                                      // onTap: () => Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => ConnectSocialAccount())),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width,
                                        height: height * 0.06,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(20)),
                                        child: _loading
                                            ? LoadingAnimationWidget.waveDots(
                                                color: Colors.white, size: height * 0.03)
                                            : Text(
                                                "Verify OTP".tr,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: height * 0.025,
                                                    color: Colors.white),
                                              ),
                                      ),
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

  FirebaseAuth auth = FirebaseAuth.instance;

  String verficationID_received = "";
  // sendOTP(String PhoneNumber) async {
  //   await auth.verifyPhoneNumber(
  //       phoneNumber: "+918840867665",
  //       // verificationCompleted: (PhoneAuthCredential credential) async {
  //       //   await auth.signInWithCredential(credential).then((value) {
  //       //     print("login successfully");
  //       //   });
  //       // },
  //       verificationFailed: (FirebaseAuthException exception) {
  //         print(exception.message);
  //       },
  //       codeSent: (String verficationID, int? resendtoken) {
  //         verficationID_received = verficationID;
  //       },
  //       codeAutoRetrievalTimeout: (String verficationID) {},
  //       verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {});
  //   print("code sent");
  //   // return verficationID_received;
  // }

  // void verifycode(
  //   String otp,
  //   BuildContext context,
  // ) async {
  //   print(otp);
  //
  //   PhoneAuthCredential credential =
  //       PhoneAuthProvider.credential(verificationId: verficationID_received, smsCode: otp);
  //   await auth.signInWithCredential(credential).then((value) async {
  //     final User? user = auth.currentUser;
  //     final uid = user?.uid;
  //     // await FirestoreMethods().uploadData(widget.user.toJson(), uid!);
  //     print("logged in successfully");
  //     // await FirebaseAuthMethods().signUpEmail(widget.user.email!, widget.user.password!);
  //     Get.to(HomeScreen());
  //     // SaveUser.saveUser(context, uid!);
  //     // MedicineSave _alarmHelper = MedicineSave();
  //     // _alarmHelper.initializeDatabase().then((value) {
  //     //   print("*******************ho gyaa");
  //     // });
  //   });
  // }
}
