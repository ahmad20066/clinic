// controllers/settings_controller.dart
import 'package:clinic/common/providers/local/cache_provider.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  var isEditingName = false.obs;
  var isEditingEmail = false.obs;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  final HomeRepository _repo = HomeRepository();

  Future<void> updateProfile({String? newName, String? newEmail}) async {
    status(RequestStatus.loading);
    final appResponse = await _repo.updatePatient({
      if (newName != null) "name": newName,
      if (newEmail != null) "email": newEmail
    });
    if (appResponse.success) {
      status(RequestStatus.success);
    } else {
      status(RequestStatus.onerror);
    }
  }

  logout() {
    Get.offAllNamed(AppRoute.welcomePageUrl);
    CacheProvider.clearStorage();
  }

  @override
  void onInit() {
    nameController.text = CacheProvider.getUserName();
    emailController.text = CacheProvider.getUserEmail();
    super.onInit();
  }
}
