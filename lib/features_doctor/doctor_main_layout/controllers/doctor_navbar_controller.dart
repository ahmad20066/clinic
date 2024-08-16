import 'package:clinic/data/enums/doctor_main_layout.dart';
import 'package:clinic/data/enums/main_layout.dart';
import 'package:get/get.dart';

class DoctorNavbarController extends GetxController {
  Rx<DoctorMainLayoutState> mainState = DoctorMainLayoutState.appointments.obs;
  setMainState(DoctorMainLayoutState state) => mainState.value = state;

  @override
  void onInit() {
    super.onInit();
  }
}
