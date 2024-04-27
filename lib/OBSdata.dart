import 'package:get/get.dart';
import 'package:medlistweb/models/UserModel.dart';

import 'models/medicine model.dart';

class PendingRequestModel {}

class ObsData extends GetxController {
  RxBool loggedIn = false.obs;
  Rx<UserModel> user = UserModel().obs;
  List<MedicineModelOld> medicines = <MedicineModelOld>[].obs;
}
