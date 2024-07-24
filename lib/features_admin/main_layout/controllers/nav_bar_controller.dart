import 'package:clinic/data/enums/admin_main_layout.dart';
import 'package:get/get.dart';

class AdminNavBarController extends GetxController {
  Rx<AdminMainLayoutState> mainState = AdminMainLayoutState.admin.obs;
  setMainState(AdminMainLayoutState state) => mainState.value = state;

  @override
  void onInit() {
    super.onInit();
  }
}
