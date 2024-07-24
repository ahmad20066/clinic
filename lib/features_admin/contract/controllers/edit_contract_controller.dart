import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/utils/utils.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/contract_model.dart';
import 'package:clinic/data/repositories/contract_repository.dart';
import 'package:clinic/features_admin/contract/controllers/contacts_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditContractController extends GetxController {
  final ContractRepository _repo = ContractRepository();

  TextEditingController salaryController = TextEditingController();
  DateRangePickerController openingDateController = DateRangePickerController();

  var updateContractRequestStatus = RequestStatus.begin.obs;

  ContractModel? contractModel;

  updateContract() async {
    updateContractRequestStatus(RequestStatus.loading);
    ContractModel newModel = ContractModel(
        id: contractModel!.id,
        salary: int.parse(salaryController.value.text),
        openingDate: Utils.dateFormat(openingDateController.selectedDate!,
            expression: 'yyyy-MM-dd'));
    final response = await _repo.updateContract(newModel);
    ContractModel updatedModel =
        ContractModel.fromJson(response.data['contract']);
    contractModel!.salary = updatedModel.salary;
    contractModel!.openingDate = updatedModel.openingDate;
    Get.find<ContractsPageController>().update();
    Get.back();
    CustomToasts.SuccessDialog('Contract Updated Successfully');
    if (response.success) {
      updateContractRequestStatus(RequestStatus.success);
    } else {
      updateContractRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    contractModel = Get.arguments;
    salaryController =
        TextEditingController(text: contractModel!.salary.toString());
    openingDateController.selectedDate =
        DateTime.parse(contractModel!.openingDate!);
    super.onInit();
  }
}
