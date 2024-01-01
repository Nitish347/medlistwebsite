import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;

  String verficationID_received = "";
  signUpEmail(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print(credential);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
  }

  void sendOTP(String PhoneNumber) {
    auth.verifyPhoneNumber(
        phoneNumber: "+918840867665",
        // verificationCompleted: (PhoneAuthCredential credential) async {
        //   await auth.signInWithCredential(credential).then((value) {
        //     print("login successfully");
        //   });
        // },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verficationID, int? resendtoken) {
          verficationID_received = verficationID;
        },
        codeAutoRetrievalTimeout: (String verficationID) {},
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {});
    print("code sent");
  }

  void verifycode(String otp, BuildContext context) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verficationID_received, smsCode: otp);
    await auth.signInWithCredential(credential).then((value) async {
      final User? user = auth.currentUser;
      final uid = user?.uid;
      // await FirestoreMethods().uploadData(widget.user.toJson(), uid!);
      print("logged in successfully");
      // SaveUser.saveUser(context, uid!);
      // MedicineSave _alarmHelper = MedicineSave();
      // _alarmHelper.initializeDatabase().then((value) {
      //   print("*******************ho gyaa");
      // });
    });
  }
}
