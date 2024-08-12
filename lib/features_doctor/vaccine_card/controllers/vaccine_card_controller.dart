import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/models/vaccine_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/patient_model.dart';
import 'package:clinic/data/models/vaccine_model.dart';
import 'package:clinic/data/repositories/home_repository.dart';
import 'package:clinic/data/repositories/vaccine_repository.dart';

class VaccineCardController extends GetxController {
  List<VaccineModel> vaccines = [];
  List<PatientModel> patients = [];
  Rx<int?> selectedVaccineId = Rx(null);
  Rx<int?> selectedPatientId = Rx(null);
  Rx<String?> selectedDate = Rx(null);
  Rx<String?> description = Rx(null);
  Rx<RequestStatus> vaccineStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> patientStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  final VaccineRepository _repo = VaccineRepository();
  final HomeRepository _homeRepo = HomeRepository();

  getVaccines() async {
    vaccineStatus(RequestStatus.loading);
    final appResponse = await _repo.getVaccines();
    print("------------");
    if (appResponse.success) {
      vaccines = (appResponse.data as List)
          .map((e) => VaccineModel.fromJson(e))
          .toList();
      vaccineStatus(RequestStatus.success);
    } else {
      vaccineStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  getPatients() async {
    patientStatus(RequestStatus.loading);
    final appResponse = await _homeRepo.getPatients();
    if (appResponse.success) {
      patients = (appResponse.data as List)
          .map((e) => PatientModel.fromMap(e))
          .toList();
      patientStatus(RequestStatus.success);
    } else {
      patientStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  Future<void> createVaccineCard() async {
    status(RequestStatus.loading);
    final model = VaccineCard(
        vaccine_id: selectedVaccineId.value!,
        patient_id: selectedPatientId.value!,
        date: selectedDate.value!,
        description: description.value!);
    final appResponse = await _repo.createVaccineCard(model);
    if (appResponse.success) {
      status(RequestStatus.success);
      CustomToasts.SuccessDialog("Vaccine Card created successfully");
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  @override
  void onInit() {
    getVaccines();
    getPatients();
    super.onInit();
  }
}
