import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/clinic_model.dart';
import 'package:clinic/data/repositories/clinic_repository.dart';
import 'package:clinic/features_admin/clinic/controllers/clinic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditClinicController extends GetxController {
  final ClinicRepository _repo = ClinicRepository();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  ClinicModel? clinicModel;

  var updateClinicRequestStatus = RequestStatus.begin.obs;

  updateClinic() async {
    updateClinicRequestStatus(RequestStatus.loading);
    ClinicModel newModel = ClinicModel(
        id: clinicModel!.id,
        name: nameController.value.text,
        description: descriptionController.value.text);
    final response = await _repo.updateClinic(newModel);
    ClinicModel updatedModel = ClinicModel.fromJson(response.data['clinic']);
    clinicModel!.name = updatedModel.name;
    clinicModel!.description = updatedModel.description!;
    Get.find<ClinicController>().update();
    Get.back();
    CustomToasts.SuccessDialog('Clinic Updated Successfully');
    if (response.success) {
      updateClinicRequestStatus(RequestStatus.success);
    } else {
      updateClinicRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    clinicModel = Get.arguments;
    nameController = TextEditingController(text: clinicModel!.name);
    descriptionController =
        TextEditingController(text: clinicModel!.description);
    super.onInit();
  }
}
