import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/vaccine_model.dart';
import 'package:clinic/data/repositories/vaccine_repository.dart';
import 'package:clinic/features_admin/vaccine/controllers/vaccines_page_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class EditVaccineController extends GetxController {
  final VaccineRepository _repo = VaccineRepository();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController targetGroupController = TextEditingController();

  var updateVaccineRequestStatus = RequestStatus.begin.obs;

  VaccineModel? vaccineModel;

  updateVaccine() async {
    updateVaccineRequestStatus(RequestStatus.loading);
    VaccineModel newModel = VaccineModel(
        id: vaccineModel!.id,
        name: nameController.value.text,
        description: descriptionController.value.text,
        targetGroup: targetGroupController.value.text,
        date: vaccineModel!.date);
    final response = await _repo.updateVaccine(newModel);
    VaccineModel updatedModel = VaccineModel.fromJson(response.data['vaccine']);
    vaccineModel!.name = updatedModel.name;
    vaccineModel!.description = updatedModel.description!;
    vaccineModel!.targetGroup = updatedModel.targetGroup;
    vaccineModel!.date = updatedModel.date!;
    Get.find<VaccinesPageController>().update();
    Get.back();
    CustomToasts.SuccessDialog('Vaccine Updated Successfully');
    if (response.success) {
      updateVaccineRequestStatus(RequestStatus.success);
    } else {
      updateVaccineRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    vaccineModel = Get.arguments;
    nameController = TextEditingController(text: vaccineModel!.name);
    descriptionController =
        TextEditingController(text: vaccineModel!.description);
    targetGroupController =
        TextEditingController(text: vaccineModel!.targetGroup);
    super.onInit();
  }
}
