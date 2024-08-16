import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/clinic_model.dart';
import 'package:clinic/data/repositories/clinic_repository.dart';
import 'package:get/get.dart';

class ClinicController extends GetxController {
  final ClinicRepository _repo = ClinicRepository();
  var clinicsRequestStatus = RequestStatus.begin.obs;
  var deleteClinicRequestStatus = RequestStatus.begin.obs;

  List<ClinicModel> clinics = [];

  getClinics() async {
    clinicsRequestStatus(RequestStatus.loading);
    final response = await _repo.getClinics();
    if (response.success) {
      clinics = (response.data['clinic'] as List)
          .map((e) => ClinicModel.fromJson(e))
          .toList();
      if (clinics.isEmpty) {
        clinicsRequestStatus(RequestStatus.nodata);
      } else {
        clinicsRequestStatus(RequestStatus.success);
      }
      
    } else {
      clinicsRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  deleteClinic(int clinicId, RxBool isLoading) async {
    isLoading.value = true;
    final response = await _repo.deleteClinic(clinicId);
    if (response.success) {
      deleteClinicRequestStatus(RequestStatus.success);
      clinics.removeWhere((clinic) => clinic.id == clinicId);
      isLoading.value = false;
      if (clinics.isEmpty) {
        clinicsRequestStatus(RequestStatus.nodata);
      }
      update();
    } else {
      CustomToasts.ErrorDialog(response.errorMessage!);
      deleteClinicRequestStatus(RequestStatus.onerror);
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getClinics();
    super.onInit();
  }
}
