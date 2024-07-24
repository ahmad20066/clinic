import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/utils/utils.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/contract_model.dart';
import 'package:clinic/data/models/employee_model.dart';
import 'package:clinic/data/repositories/contract_repository.dart';
import 'package:clinic/data/repositories/employee_repository.dart';
import 'package:clinic/features_admin/contract/controllers/contacts_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateContractController extends GetxController {
  final ContractRepository _repo = ContractRepository();
  final EmployeeRepository _employeeRepository = EmployeeRepository();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController employeeIdController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  DateRangePickerController openingDateController = DateRangePickerController();
  DateRangePickerController contractDateController =
      DateRangePickerController();

  var createContractRequestStatus = RequestStatus.begin.obs;

  createContract() async {
    createContractRequestStatus(RequestStatus.loading);
    ContractModel model = ContractModel(
        employeeId: selectedEmployee.value!.id,
        salary: int.parse(salaryController.value.text),
        openingDate: Utils.dateFormat(openingDateController.selectedDate!,
            expression: 'yyyy-MM-dd'),
        contractDate: Utils.dateFormat(contractDateController.selectedDate!,
            expression: 'yyyy-MM-dd'));
    final response = await _repo.createContract(model);
    print(response.data);
    if (response.success) {
      Get.find<ContractsPageController>()
          .contracts
          .add(ContractModel.fromJson(response.data['contract']));
      Get.find<ContractsPageController>().update();
      Get.find<ContractsPageController>()
          .contractsRequestStatus(RequestStatus.success);
      createContractRequestStatus(RequestStatus.success);
      Get.back();
      CustomToasts.SuccessDialog('Contract created successfully');
    } else {
      createContractRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  var getEmployeeRequestStatus = RequestStatus.begin.obs;
  List<EmployeeModel> employees = [];
  Rx<EmployeeModel?> selectedEmployee = Rx(null);

  getEmployees() async {
    getEmployeeRequestStatus(RequestStatus.loading);
    final response = await _employeeRepository.getEmployees();
    if (response.success) {
      employees = (response.data['employe'] as List)
          .map((e) => EmployeeModel.fromJson(e))
          .toList();
      if (employees.isEmpty) {
        getEmployeeRequestStatus(RequestStatus.nodata);
      } else {
        getEmployeeRequestStatus(RequestStatus.success);
      }
    } else {
      getEmployeeRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  selectEmployee(int id) {
    final employee = employees.firstWhere((element) => element.id == id);
    selectedEmployee.value = employee;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getEmployees();
    super.onInit();
  }
}
