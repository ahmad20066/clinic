import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/clinic_model.dart';
import 'package:clinic/data/repositories/clinic_repository.dart';
import 'package:clinic/features_admin/clinic/controllers/clinic_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateClinicController extends GetxController {
  final ClinicRepository _repo = ClinicRepository();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var createClinicRequestStatus = RequestStatus.begin.obs;

  createClinic() async {
    createClinicRequestStatus(RequestStatus.loading);
    ClinicModel model = ClinicModel(
        name: nameController.value.text,
        description: descriptionController.value.text,
        adminId: 1);
    final response = await _repo.createClinic(model);
    print(response.data);
    if (response.success) {
      Get.find<ClinicController>()
          .clinics
          .add(ClinicModel.fromJson(response.data[0]));
      Get.find<ClinicController>().update();
      Get.find<ClinicController>().clinicsRequestStatus(RequestStatus.success);
      createClinicRequestStatus(RequestStatus.success);
      Get.back();
      CustomToasts.SuccessDialog('Clinic created successfully');
    } else {
      createClinicRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }
}
