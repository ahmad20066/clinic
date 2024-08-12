import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/appointment_model.dart';
import 'package:clinic/data/repositories/home_repository.dart';
import 'package:get/get.dart';

class AppointmentsController extends GetxController {
  List<AppointmentModel> appointments = [];
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  final HomeRepository _repo = HomeRepository();
  getAppointments() async {
    status(RequestStatus.loading);
    final appResponse = await _repo.getAppointments();
    if (appResponse.success) {
      appointments = (appResponse.data as List)
          .map((e) => AppointmentModel.fromMap(e))
          .toList();
      status(RequestStatus.success);
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  @override
  void onInit() {
    getAppointments();
    super.onInit();
  }
}
