import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/utils/utils.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/clinic_model.dart';
import 'package:clinic/data/models/vaccine_model.dart';
import 'package:clinic/data/repositories/vaccine_repository.dart';
import 'package:clinic/features_admin/clinic/controllers/clinic_controller.dart';
import 'package:clinic/features_admin/vaccine/controllers/vaccines_page_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateVaccineController extends GetxController {
  final VaccineRepository _repo = VaccineRepository();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController clinicIdController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController targetGroupController = TextEditingController();
  DateRangePickerController dateController = DateRangePickerController();

  Rx<ClinicModel?> selectedClinic = Rx(null);

  var createVaccineRequestStatus = RequestStatus.begin.obs;

  createVaccine() async {
    createVaccineRequestStatus(RequestStatus.loading);
    VaccineModel model = VaccineModel(
      name: nameController.value.text,
      description: descriptionController.value.text,
      clinicId: selectedClinic.value!.id,
      targetGroup: targetGroupController.value.text,
      date: Utils.dateFormat(dateController.selectedDate!,
          expression: 'yyyy-MM-dd'),
    );
    final response = await _repo.createVaccine(model);
    print(response.data);
    if (response.success) {
      Get.find<VaccinesPageController>()
          .vaccines
          .add(VaccineModel.fromJson(response.data['data']));
      Get.find<VaccinesPageController>().update();
      Get.find<VaccinesPageController>()
          .vaccinesRequestStatus(RequestStatus.success);
      createVaccineRequestStatus(RequestStatus.success);
      Get.back();
      CustomToasts.SuccessDialog('Vaccine created successfully');
    } else {
      createVaccineRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  selectClinic(int id) {
    final clinic = Get.find<ClinicController>()
        .clinics
        .firstWhere((element) => element.id == id);
    selectedClinic.value = clinic;
  }
}
