import 'package:clinic/common/providers/local/cache_provider.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/user_model.dart';
import 'package:clinic/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  RxInt value = 0.obs;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  final AuthRepository _repo = AuthRepository();
  String _valueToString(val) {
    if (val == 0) {
      return "user";
    } else if (val == 1) {
      return "doctor";
    } else if (val == 2) {
      return "admin";
    } else {
      return "employee";
    }
  }

  register() async {
    status(RequestStatus.loading);
    final user = UserModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        type: _valueToString(value.value));
    final appResponse = await _repo.register(user);
    if (appResponse.success) {
      status(RequestStatus.success);
      CacheProvider.setAppToken(appResponse.data['access_token']);
      final val = _valueToString(value.value);

      if (val == "doctor") {
        Get.toNamed(AppRoute.doctorPageUrl, arguments: {
          'email': emailController.text,
          "password": passwordController.text,
          "name": nameController.text
        });
      } else if (val == "admin") {
        Get.toNamed(AppRoute.adminPageUrl, arguments: {
          'email': emailController.text,
          "password": passwordController.text,
          "name": nameController.text
        });
      } else if (val == "user") {
        Get.toNamed(AppRoute.patientPageUrl, arguments: {
          'email': emailController.text,
          "password": passwordController.text,
          "name": nameController.text
        });
      } else {}
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }
}
