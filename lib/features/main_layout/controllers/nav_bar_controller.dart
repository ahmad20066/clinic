import 'package:clinic/data/enums/admin_main_layout.dart';
import 'package:clinic/data/enums/main_layout.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  Rx<MainLayoutState> mainState = MainLayoutState.home.obs;
  setMainState(MainLayoutState state) => mainState.value = state;

  @override
  void onInit() {
    super.onInit();
  }
}
