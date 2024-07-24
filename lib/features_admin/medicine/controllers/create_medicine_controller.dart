import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/utils/utils.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/clinic_model.dart';
import 'package:clinic/data/models/medicine_model.dart';
import 'package:clinic/data/repositories/medicine_repository.dart';
import 'package:clinic/features_admin/clinic/controllers/clinic_controller.dart';
import 'package:clinic/features_admin/medicine/controllers/medicines_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateMedicineController extends GetxController {
  final MedicineRepository _repo = MedicineRepository();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController targetGroupController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  DateRangePickerController dateController = DateRangePickerController();
  Rx<ClinicModel?> selectedClinic = Rx(null);

  var createMedicineRequestStatus = RequestStatus.begin.obs;

  createVaccine() async {
    createMedicineRequestStatus(RequestStatus.loading);
    MedicineModel model = MedicineModel(
      name: nameController.value.text,
      description: descriptionController.value.text,
      clinicId: selectedClinic.value!.id,
      targetGroup: targetGroupController.value.text,
      price: int.parse(priceController.value.text),
      date: Utils.dateFormat(dateController.selectedDate!,
          expression: 'yyyy-MM-dd'),
    );
    final response = await _repo.createMedicine(model);
    print(response.data);
    if (response.success) {
      Get.find<MedicinesPageController>()
          .medicines
          .add(MedicineModel.fromJson(response.data['data']));
      Get.find<MedicinesPageController>().update();
      Get.find<MedicinesPageController>()
          .medicinesRequestStatus(RequestStatus.success);
      createMedicineRequestStatus(RequestStatus.success);
      Get.back();
      CustomToasts.SuccessDialog('Medicine created successfully');
    } else {
      createMedicineRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  selectClinic(int id) {
    final clinic = Get.find<ClinicController>()
        .clinics
        .firstWhere((element) => element.id == id);
    selectedClinic.value = clinic;
  }
}
