import 'package:get/get.dart';
import 'package:medlistweb/models/UserModel.dart';

class PendingRequestModel {}

class ObsData extends GetxController {
  RxBool loggedIn = false.obs;
  Rx<UserModel> user = UserModel().obs;
}
