import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/common/widgets/no_data.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_employee/employee_reviews/controllers/employee_reviews_controller.dart';
import 'package:clinic/features_employee/employee_reviews/widgets/emp_review_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeReviews extends GetView<EmployeeReviewsController> {
  const EmployeeReviews({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmployeeReviewsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          switch (controller.employeeReviewRequestStatus.value) {
            case RequestStatus.loading:
              return const Center(child: CustomLoader());
            case RequestStatus.onerror:
              return const NoData(
                text: 'Error occured',
              );
            case RequestStatus.nodata:
              return const NoData(
                text: 'No reports Available',
              );
            case RequestStatus.success:
              return ListView.builder(
                  itemCount: controller.reviews.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return EmpReviewWidget(
                      model: controller.reviews[i],
                    );
                  });
        
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
