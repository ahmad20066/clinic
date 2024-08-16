import 'package:clinic/common/providers/local/cache_provider.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 5)).then((e) {
      if (CacheProvider.getAppToken() == null) {
        Get.offAllNamed(AppRoute.welcomePageUrl);
      } else {
        final type = CacheProvider.getUserType();
        if (type == "user") {
          Get.offAllNamed(AppRoute.mainLayout);
        } else if (type == "doctor") {
          Get.offAllNamed(AppRoute.doctormainLayout);
        } else if (type == 'admin') {
          Get.offAllNamed(AppRoute.adminMainLayout);
        } else {
          Get.offAllNamed(AppRoute.welcomePageUrl);
        }
      }
    });

    super.onInit();
  }
}
