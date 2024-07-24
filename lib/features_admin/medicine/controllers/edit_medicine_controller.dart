import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/medicine_model.dart';
import 'package:clinic/data/repositories/medicine_repository.dart';
import 'package:clinic/features_admin/medicine/controllers/medicines_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMedicineController extends GetxController {
  final MedicineRepository _repo = MedicineRepository();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController targetGroupController = TextEditingController();

  var updateMedicineRequestStatus = RequestStatus.begin.obs;

  MedicineModel? medicineModel;

  updateMedicine() async {
    updateMedicineRequestStatus(RequestStatus.loading);
    MedicineModel newModel = MedicineModel(
        id: medicineModel!.id,
        name: nameController.value.text,
        description: descriptionController.value.text,
        targetGroup: targetGroupController.value.text,
        date: medicineModel!.date);
    final response = await _repo.updateMedicine(newModel);
    MedicineModel updatedModel =
        MedicineModel.fromJson(response.data['medical']);
    medicineModel!.name = updatedModel.name;
    medicineModel!.description = updatedModel.description!;
    medicineModel!.targetGroup = updatedModel.targetGroup;
    medicineModel!.date = updatedModel.date!;
    Get.find<MedicinesPageController>().update();
    Get.back();
    CustomToasts.SuccessDialog('Medicine Updated Successfully');
    if (response.success) {
      updateMedicineRequestStatus(RequestStatus.success);
    } else {
      updateMedicineRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    medicineModel = Get.arguments;
    nameController = TextEditingController(text: medicineModel!.name);
    descriptionController =
        TextEditingController(text: medicineModel!.description);
    targetGroupController =
        TextEditingController(text: medicineModel!.targetGroup);
    super.onInit();
  }
}
