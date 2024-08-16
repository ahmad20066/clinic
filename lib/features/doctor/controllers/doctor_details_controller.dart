import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/doctor_model.dart';
import 'package:clinic/data/repositories/home_repository.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DoctorDetailsController extends GetxController {
  DoctorModel? doctor;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  final HomeRepository _repo = HomeRepository();
  DateRangePickerController dateController = DateRangePickerController();
  @override
  void onInit() {
    doctor = Get.arguments;
    super.onInit();
  }

  createAppointment() async {
    status(RequestStatus.loading);
    final appResponse = await _repo.createAppointment({
      "id": doctor!.id,
      "patient_id": 1,
      "date": dateController.selectedDate
    });
    if (appResponse.success) {
      status(RequestStatus.success);
      Get.back();
      CustomToasts.SuccessDialog("Appointment Book Successfully");
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }
}
