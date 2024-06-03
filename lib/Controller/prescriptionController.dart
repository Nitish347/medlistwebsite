import 'package:get/get.dart';
import 'package:medlistweb/models/MedicineModel.dart';
import 'package:medlistweb/models/UserModel.dart';
import 'package:medlistweb/models/eat_model.dart';
import 'package:medlistweb/models/exerscise_post_model.dart';
import 'package:medlistweb/models/medicine%20model.dart';

class PendingRequestModel {}

class PrescriptionController extends GetxController {
  RxList<MedicineModel> prescribeMedicine = <MedicineModel>[ MedicineModel(),MedicineModel() ,MedicineModel(),MedicineModel(),MedicineModel()].obs;
  RxList<ExersisePostModel> prescribeExercise = <ExersisePostModel>[ ExersisePostModel(),ExersisePostModel() ,ExersisePostModel(),ExersisePostModel(),ExersisePostModel()].obs;
  RxList<Eat> presWhatToEat = <Eat>[ Eat(),Eat(),Eat(),Eat(),Eat()].obs;
  RxList<Eat> presWhatToAvoid = <Eat>[ Eat(),Eat(),Eat(),Eat(),Eat()].obs;
}
