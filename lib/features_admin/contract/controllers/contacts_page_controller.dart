import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/contract_model.dart';
import 'package:clinic/data/repositories/contract_repository.dart';
import 'package:get/get.dart';

class ContractsPageController extends GetxController {
  final ContractRepository _repo = ContractRepository();
  var contractsRequestStatus = RequestStatus.begin.obs;
  var deleteMedicineRequestStatus = RequestStatus.begin.obs;

  List<ContractModel> contracts = [];

  getcontracts() async {
    contractsRequestStatus(RequestStatus.loading);
    final response = await _repo.getContracts();
    print(response.data);
    if (response.success) {
      contracts = (response.data['contract'] as List)
          .map((e) => ContractModel.fromJson(e))
          .toList();
      if (contracts.isEmpty) {
        contractsRequestStatus(RequestStatus.nodata);
      } else {
        contractsRequestStatus(RequestStatus.success);
      }
    } else {
      contractsRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  deleteContract(int contractId, RxBool isLoading) async {
    isLoading.value = true;
    final response = await _repo.deleteContract(contractId);
    if (response.success) {
      deleteMedicineRequestStatus(RequestStatus.success);
      contracts.removeWhere((clinic) => clinic.id == contractId);
      isLoading.value = false;
      if (contracts.isEmpty) {
        contractsRequestStatus(RequestStatus.nodata);
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
    getcontracts();
    super.onInit();
  }
}
