import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/admin_model.dart';
import 'package:clinic/data/repositories/admin_repository.dart';
import 'package:get/get.dart';

class AdminPageController extends GetxController {
  final AdminRepository _repo = AdminRepository();
  var adminsRequestStatus = RequestStatus.begin.obs;
  var deleteAdminRequestStatus = RequestStatus.begin.obs;

  List<AdminModel> admins = [];

  getAdmins() async {
    adminsRequestStatus(RequestStatus.loading);
    final response = await _repo.getAdmins();
    print(response.data);
    if (response.success) {
      admins = (response.data['admin'] as List)
          .map((e) => AdminModel.fromJson(e))
          .toList();
      if (admins.isEmpty) {
        adminsRequestStatus(RequestStatus.nodata);
      } else {
        adminsRequestStatus(RequestStatus.success);
      }
    } else {
      adminsRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  deleteContract(int adminId, RxBool isLoading) async {
    isLoading.value = true;
    final response = await _repo.deleteAdmin(adminId);
    if (response.success) {
      deleteAdminRequestStatus(RequestStatus.success);
      admins.removeWhere((clinic) => clinic.id == adminId);
      isLoading.value = false;
      if (admins.isEmpty) {
        adminsRequestStatus(RequestStatus.nodata);
      }
      update();
    } else {
      CustomToasts.ErrorDialog(response.errorMessage!);
      deleteAdminRequestStatus(RequestStatus.onerror);
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAdmins();
    super.onInit();
  }
}