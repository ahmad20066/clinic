import 'package:clinic/common/providers/local/cache_provider.dart';
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
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }
}
