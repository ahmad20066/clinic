import 'package:clinic/common/providers/local/cache_provider.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/utils/utils.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/patient_model.dart';
import 'package:clinic/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PatientFormController extends GetxController {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  TextEditingController? dateController = TextEditingController();
  DateTime? date;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  String? gender;
  changeGender(String value) {
    gender = value;
    update();
  }

// Utils.dateFormat(dateController.selectedDate!,
//           expression: 'yyyy-MM-dd')
  final AuthRepository _repo = AuthRepository();
  createPatient() async {
    status(RequestStatus.loading);
    final PatientModel patient = PatientModel(
      gender: gender!,
      id: 0,
      budget: budgetController.text,
      age: ageController.text,
      date: Utils.dateFormat(date!, expression: 'yyyy-MM-dd'),
      name: Get.arguments['name'],
    );
    final appResponse = await _repo.createPatient(patient);
    if (appResponse.success) {
      status(RequestStatus.success);
      CacheProvider.setUserName(Get.arguments['name']);
      CacheProvider.setUserEmail(Get.arguments['email']);
      CacheProvider.setUserID(appResponse.data['data']['id']);
      Get.offAllNamed(AppRoute.mainLayout);
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }
}
