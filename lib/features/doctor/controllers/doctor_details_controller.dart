import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/doctor_model.dart';
import 'package:get/get.dart';

class DoctorDetailsController extends GetxController {
  DoctorModel? doctor;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  @override
  void onInit() {
    doctor = Get.arguments;
    super.onInit();
  }
}
