import 'package:get/get.dart';
import 'package:medlistweb/models/MedicineModel.dart';
import 'package:medlistweb/models/UserModel.dart';
import 'package:medlistweb/models/medicine%20model.dart';

class PendingRequestModel {}

class PrescriptionController extends GetxController {
  RxList<MedicineModel> prescribeMedicine = <MedicineModel>[ MedicineModel(),MedicineModel() ,MedicineModel(),MedicineModel(),MedicineModel()].obs;
}
