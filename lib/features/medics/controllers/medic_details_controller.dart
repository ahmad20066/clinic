import 'package:clinic/data/models/medic_model.dart';
import 'package:get/get.dart';

class MedicDetailsController extends GetxController {
  MedicModel? medicine;
  @override
  void onInit() {
    medicine = Get.arguments;
    super.onInit();
  }
}
