import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/admin_model.dart';
import 'package:clinic/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminFormController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  final AuthRepository _repo = AuthRepository();
  createAdmin() async {
    status(RequestStatus.loading);
    final AdminModel admin = AdminModel(
      phone: phoneController.text,
      address: addressController.text,
      name: Get.arguments['name'],
      // email: Get.arguments['email'],
      // type: "admin",
    );
    final appResponse = await _repo.createAdmin(admin);
    if (appResponse.success) {
      status(RequestStatus.success);
      Get.offAllNamed(AppRoute.mainLayout);
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }
}
