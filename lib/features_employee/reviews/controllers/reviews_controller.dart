import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/utils/utils.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/clinic_model.dart';
import 'package:clinic/data/models/review_model.dart';
import 'package:clinic/data/repositories/clinic_repository.dart';
import 'package:clinic/data/repositories/employee_repository.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ReviewsController extends GetxController {
  final ClinicRepository _clincRepo = ClinicRepository();
  final EmployeeRepository _repo = EmployeeRepository();
  var clinicsRequestStatus = RequestStatus.begin.obs;
  var reviewsRequestStatus = RequestStatus.begin.obs;

  Rx<ClinicModel?> selectedClinic = Rx(null);
  DateRangePickerController dateController = DateRangePickerController();

  List<ClinicModel> clinics = [];
  ReviewModel? reviews;
  RxInt ordersCount = 0.obs;
  RxInt bookingCount = 0.obs;

  getClinics() async {
    clinicsRequestStatus(RequestStatus.loading);
    final response = await _clincRepo.getClinics();
    if (response.success) {
      clinics = (response.data['clinic'] as List)
          .map((e) => ClinicModel.fromJson(e))
          .toList();
      if (clinics.isEmpty) {
        clinicsRequestStatus(RequestStatus.nodata);
      } else {
        clinicsRequestStatus(RequestStatus.success);
      }
    } else {
      clinicsRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  selectClinic(int id) {
    final clinic = clinics.firstWhere((element) => element.id == id);
    selectedClinic.value = clinic;
  }

  getReviews() async {
    if (selectedClinic.value == null) {
      CustomToasts.ErrorDialog('Please select a clinic');
    } else if (dateController.selectedDate == null) {
      CustomToasts.ErrorDialog('Please select a date');
    } else {
      Get.back();
      reviewsRequestStatus(RequestStatus.loading);
      final response = await _repo.getReviews(
          selectedClinic.value!.id.toString(),
          Utils.dateFormat(dateController.selectedDate!,
              expression: "yyyy-MM-dd"));
      if (response.success) {
        reviews = ReviewModel.fromJson(response.data);
        ordersCount.value = reviews!.numberOfOrders!;
        bookingCount.value = reviews!.numberOfBooked!;
        reviewsRequestStatus(RequestStatus.success);
        update();
      } else {
        reviewsRequestStatus(RequestStatus.onerror);
        CustomToasts.ErrorDialog(response.errorMessage!);
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getClinics();
    super.onInit();
  }
}
