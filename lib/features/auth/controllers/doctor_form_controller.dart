import 'dart:io';

import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/doctor_model.dart';
import 'package:clinic/data/models/section_model.dart';
import 'package:clinic/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorFormController extends GetxController {
  TextEditingController ageController = TextEditingController();
  TextEditingController workHourController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Rx<File?> image = Rx(null);
  List<SectionModel> sections = [];
  RxInt selectedSection = 0.obs;
  final AuthRepository _repo = AuthRepository();
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  createDoctor() async {
    status(RequestStatus.loading);
    final doctor = DoctorModel(
      name: Get.arguments['name'],
      phone_number: phoneController.text,
      address: addressController.text,
      age: ageController.text,
      section_id: 1,
      working_hour: workHourController.text,
    );
    final appResponse = await _repo.createDoctor(doctor);

    print("aa");
    if (appResponse.success) {
      status(RequestStatus.success);
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }
}
