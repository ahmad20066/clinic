import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/doctor_model.dart';
import 'package:clinic/data/models/medic_model.dart';
import 'package:clinic/data/repositories/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<MedicModel> medics = [];
  List<DoctorModel> doctors = [];
  Rx<RequestStatus> medicsStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> doctorsStatus = RequestStatus.begin.obs;
  final HomeRepository _repo = HomeRepository();
  getMedics() async {
    medicsStatus(RequestStatus.loading);
    final appResponse = await _repo.getMedics();
    if (appResponse.success) {
      medics =
          (appResponse.data as List).map((e) => MedicModel.fromMap(e)).toList();
      medicsStatus(RequestStatus.success);
    } else {
      medicsStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  getDoctors() async {
    doctorsStatus(RequestStatus.loading);
    final appResponse = await _repo.getDoctors();
    if (appResponse.success) {
      doctors = (appResponse.data as List)
          .map((e) => DoctorModel.fromMap(e))
          .toList();
      doctorsStatus(RequestStatus.success);
    } else {
      doctorsStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  @override
  void onInit() {
    getMedics();
    getDoctors();
    super.onInit();
  }
}
