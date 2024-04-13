import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/NetworkHandler.dart';
import 'app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  // final controller = Get.put(AccountController());
  // final OBSaccountController = Get.put(ObsData());
  //bool isAuthenticated = false;
  // final OBSaccountController = Get.put(ObsData());
  checkLogin() async {
    String? token = await NetworkHandler.getToken();
    if (token != null) {
      log("-->> logged in");
      // var response = await NetWorkHandler.get("api/user");
      // log(response.toString());
      // if (response != null) {
      //   // Get.offAllNamed(Routes.BOTTOMBAR);
      //   log("-->>Auth successs so you can processs");
      // } else {
      //   print("Something went wrong while checking token");
      //   // Get.offAllNamed(Routes.LOGIN);
      // }
    } else {
      log("token is null ");
      // OBSaccountController.loggedIn.value = false;
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  RouteSettings? redirect(String? route) {
    checkLogin();
    return null;
  }


  //This function will be called right before the Bindings are initialized.
  // Here we can change Bindings for this page.

  //This function will be called right after the Bindings are initialized.
  // Here we can do something after  bindings created and before creating the page widget.

  // Page build and widgets of page will be shown

  //This function will be called right after disposing all the related objects
  // (Controllers, views, ...) of the page.
}
