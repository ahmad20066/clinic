import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/admin_model.dart';
import 'package:clinic/data/repositories/admin_repository.dart';
import 'package:clinic/features_admin/admin/controllers/admin_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAdminController extends GetxController {
  final AdminRepository _repo = AdminRepository();

  TextEditingController nameController = TextEditingController();

  var updateAdminRequestStatus = RequestStatus.begin.obs;

  AdminModel? adminModel;

  updateVaccine() async {
    updateAdminRequestStatus(RequestStatus.loading);
    AdminModel newModel = AdminModel(
      id: adminModel!.id,
      name: nameController.value.text,
    );
    final response = await _repo.updateAdmin(newModel);
    AdminModel updatedModel = AdminModel.fromJson(response.data['admin']);
    adminModel!.name = updatedModel.name;
    Get.find<AdminPageController>().update();
    Get.back();
    CustomToasts.SuccessDialog('Admin Updated Successfully');
    if (response.success) {
      updateAdminRequestStatus(RequestStatus.success);
    } else {
      updateAdminRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    adminModel = Get.arguments;
    nameController = TextEditingController(text: adminModel!.name);

    super.onInit();
  }
}
