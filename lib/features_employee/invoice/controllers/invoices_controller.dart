import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/invoice_model.dart';
import 'package:get/get.dart';

import '../../../data/repositories/employee_repository.dart';

class InvoicesController extends GetxController {
final EmployeeRepository _Repo = EmployeeRepository();
  var invoicesRequestStatus = RequestStatus.begin.obs;

  List<InvoiceModel> invoices = [];

  getInvoices() async {
    invoicesRequestStatus(RequestStatus.loading);
    final response = await _Repo.getInvoices();
    print(response.data);
    if (response.success) {
      invoices = (response.data['invoice'] as List)
          .map((e) => InvoiceModel.fromJson(e))
          .toList();
      if (invoices.isEmpty) {
        invoicesRequestStatus(RequestStatus.nodata);
      } else {
        invoicesRequestStatus(RequestStatus.success);
      }
    } else {
      invoicesRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getInvoices();
    super.onInit();
  }
}