import 'package:clinic/data/enums/employee_main_layout.dart';
import 'package:get/get.dart';

class EmployeeNavbarController extends GetxController {
  Rx<EmployeeMainLayoutState> mainState = EmployeeMainLayoutState.reports.obs;
  setMainState(EmployeeMainLayoutState state) => mainState.value = state;

  @override
  void onInit() {
    super.onInit();
  }
}
