import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/admin_model.dart';
import 'package:clinic/data/repositories/admin_repository.dart';
import 'package:clinic/features_admin/admin/controllers/admin_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAdminController extends GetxController {
  final AdminRepository _repo = AdminRepository();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var createAdminRequestStatus = RequestStatus.begin.obs;

  createAdmin() async {
    createAdminRequestStatus(RequestStatus.loading);
    AdminModel model = AdminModel(
      name: nameController.value.text,
      address: addressController.value.text,
      phone: phoneController.value.text,
    );
    final response = await _repo.createAdmin(model);
    print(response.data);
    if (response.success) {
      Get.find<AdminPageController>()
          .admins
          .add(AdminModel.fromJson(response.data['data']));
      Get.find<AdminPageController>().update();
      Get.find<AdminPageController>()
          .adminsRequestStatus(RequestStatus.success);
      createAdminRequestStatus(RequestStatus.success);
      Get.back();
      CustomToasts.SuccessDialog('Admin created successfully');
    } else {
      createAdminRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }
}
