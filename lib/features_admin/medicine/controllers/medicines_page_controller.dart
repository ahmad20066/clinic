import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/medicine_model.dart';
import 'package:clinic/data/repositories/medicine_repository.dart';
import 'package:get/get.dart';

class MedicinesPageController extends GetxController {
  final MedicineRepository _repo = MedicineRepository();
  var medicinesRequestStatus = RequestStatus.begin.obs;
  var deleteMedicineRequestStatus = RequestStatus.begin.obs;

  List<MedicineModel> medicines = [];

  getMedicines() async {
    medicinesRequestStatus(RequestStatus.loading);
    final response = await _repo.getMedicines();
    print(response.data);
    if (response.success) {
      medicines = (response.data['medical'] as List)
          .map((e) => MedicineModel.fromJson(e))
          .toList();
      if (medicines.isEmpty) {
        medicinesRequestStatus(RequestStatus.nodata);
      } else {
        medicinesRequestStatus(RequestStatus.success);
      }
    } else {
      medicinesRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  deleteMedicine(int vaccineId, RxBool isLoading) async {
    isLoading.value = true;
    final response = await _repo.deleteMedicine(vaccineId);
    if (response.success) {
      deleteMedicineRequestStatus(RequestStatus.success);
      medicines.removeWhere((clinic) => clinic.id == vaccineId);
      isLoading.value = false;
      if (medicines.isEmpty) {
        medicinesRequestStatus(RequestStatus.nodata);
      }
      update();
    } else {
      CustomToasts.ErrorDialog(response.errorMessage!);
      deleteMedicineRequestStatus(RequestStatus.onerror);
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getMedicines();
    super.onInit();
  }
}