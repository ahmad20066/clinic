import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/employee_review.dart';
import 'package:clinic/data/repositories/employee_repository.dart';
import 'package:get/get.dart';

class EmployeeReviewsController extends GetxController {
  final EmployeeRepository _Repo = EmployeeRepository();
  var employeeReviewRequestStatus = RequestStatus.begin.obs;

  List<EmployeeReviewModel> reviews = [];

  getEmpReview() async {
    employeeReviewRequestStatus(RequestStatus.loading);
    final response = await _Repo.getEmployeeReviews(3);
    print(response.data);
    if (response.success) {
      reviews = (response.data['emp_contract'] as List)
          .map((e) => EmployeeReviewModel.fromJson(e))
          .toList();
      if (reviews.isEmpty) {
        employeeReviewRequestStatus(RequestStatus.nodata);
      } else {
        employeeReviewRequestStatus(RequestStatus.success);
      }
    } else {
      employeeReviewRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getEmpReview();
    super.onInit();
  }
}
