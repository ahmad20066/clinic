import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/doctor_model.dart';
import 'package:clinic/data/repositories/home_repository.dart';
import 'package:get/get.dart';

class SearchDoctorsController extends GetxController {
  List<DoctorModel> doctors = [];
  RxList<DoctorModel> searchDoctors = <DoctorModel>[].obs;
  Rx<RequestStatus> doctorsStatus = RequestStatus.begin.obs;
  final HomeRepository _repo = HomeRepository();
  getDoctors() async {
    doctorsStatus(RequestStatus.loading);
    final appResponse = await _repo.getDoctors();
    if (appResponse.success) {
      doctors = (appResponse.data as List)
          .map((e) => DoctorModel.fromMap(e))
          .toList();
      searchDoctors.value = doctors;
      doctorsStatus(RequestStatus.success);
    } else {
      doctorsStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  searchDcotors(String value) {
    if (value.isEmpty) {
      searchDoctors.value = doctors;
    } else {
      searchDoctors.value =
          doctors.where((e) => e.name.contains(value)).toList();
    }
  }

  @override
  void onInit() {
    getDoctors();
    super.onInit();
  }
}
