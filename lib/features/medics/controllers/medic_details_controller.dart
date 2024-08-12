import 'package:clinic/common/providers/local/cache_provider.dart';
import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/utils/utils.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/medic_model.dart';
import 'package:clinic/data/models/order_med_model.dart';
import 'package:clinic/data/models/order_model.dart';
import 'package:clinic/data/repositories/home_repository.dart';
import 'package:get/get.dart';

class MedicDetailsController extends GetxController {
  MedicModel? medicine;
  RxInt quantity = 1.obs;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  final HomeRepository _repo = HomeRepository();
  @override
  void onInit() {
    medicine = Get.arguments;
    super.onInit();
  }

  increaseQuantity() {
    quantity += 1;
  }

  decreaseQuantity() {
    quantity += 1;
  }

  createOrder() async {
    status(RequestStatus.loading);
    final orderModel = OrderModel(
        date: DateTime.now().toString(),
        patient_id: CacheProvider.getUserID(),
        clinic_id: 1);
    final appResponse = await _repo.createOrder(orderModel);
    if (appResponse.success) {
      final orderMedModel = OrderMedModel(
          order_id: appResponse.data['order']['id'],
          medical_id: medicine!.id,
          amount: quantity.value);
      final appResponse2 = await _repo.createOrderMed(orderMedModel);
      if (appResponse2.success) {
        final invoice = {
          "medical": [medicine!.id],
          "date": Utils.dateFormat(DateTime.now(), expression: 'yyyy-MM-dd')
        };
        final appResponse3 = await _repo.createInvoice(invoice);
        if (appResponse3.success) {
          status(RequestStatus.success);
          Get.back();
          CustomToasts.SuccessDialog("Order Created Successfully");
        } else {
          status(RequestStatus.onerror);
          CustomToasts.ErrorDialog(appResponse3.errorMessage!);
        }
      } else {
        status(RequestStatus.onerror);
        CustomToasts.ErrorDialog(appResponse2.errorMessage!);
      }
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }
}
