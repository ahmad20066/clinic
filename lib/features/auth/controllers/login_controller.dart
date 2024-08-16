import 'package:clinic/common/providers/local/cache_provider.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthRepository _repo = AuthRepository();
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  login() async {
    status(RequestStatus.loading);
    final appResponse = await _repo.login(
        {"email": emailController.text, "password": passwordController.text});
    print("Ss");
    if (appResponse.success) {
      status(RequestStatus.success);
      CacheProvider.setAppToken(appResponse.data['token']);
      CacheProvider.setUserName(appResponse.data['user']['name']);
      CacheProvider.setUserEmail(appResponse.data['user']['email']);
      CacheProvider.setUserID(appResponse.data['user']['id']);
      final type = appResponse.data['user']['type'];
      CacheProvider.setUserType(appResponse.data['user']['type']);
      if (type == "user") {
        Get.offAllNamed(AppRoute.mainLayout);
      } else if (type == "doctor") {
        Get.offAllNamed(AppRoute.doctormainLayout);
      } else if (type == 'admin') {
        Get.offAllNamed(AppRoute.adminMainLayout);
      } else {}
      // Get.offAllNamed(AppRoute.homePageUrl);
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }
}
