import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/vaccine_model.dart';
import 'package:clinic/data/repositories/vaccine_repository.dart';
import 'package:get/get.dart';

class VaccinesPageController extends GetxController {
  final VaccineRepository _repo = VaccineRepository();
  var vaccinesRequestStatus = RequestStatus.begin.obs;
  var deleteVaccineRequestStatus = RequestStatus.begin.obs;

  List<VaccineModel> vaccines = [];

  getVaccines() async {
    vaccinesRequestStatus(RequestStatus.loading);
    final response = await _repo.getVaccines();
    print(response.data);
    if (response.success) {
      vaccines = (response.data['vaccine'] as List)
          .map((e) => VaccineModel.fromJson(e))
          .toList();
      if (vaccines.isEmpty) {
        vaccinesRequestStatus(RequestStatus.nodata);
      } else {
        vaccinesRequestStatus(RequestStatus.success);
      }
    } else {
      vaccinesRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  deleteVaccine(int vaccineId, RxBool isLoading) async {
    isLoading.value = true;
    final response = await _repo.deleteVaccine(vaccineId);
    if (response.success) {
      deleteVaccineRequestStatus(RequestStatus.success);
      vaccines.removeWhere((clinic) => clinic.id == vaccineId);
      isLoading.value = false;
      if (vaccines.isEmpty) {
        vaccinesRequestStatus(RequestStatus.nodata);
      }
      update();
    } else {
      CustomToasts.ErrorDialog(response.errorMessage!);
      deleteVaccineRequestStatus(RequestStatus.onerror);
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getVaccines();
    super.onInit();
  }
}
