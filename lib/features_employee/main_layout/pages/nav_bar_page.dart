import 'package:clinic/data/enums/employee_main_layout.dart';
import 'package:clinic/features_employee/employee_reviews/pages/employee_reviews_page.dart';
import 'package:clinic/features_employee/invoice/pages/invoices_page.dart';
import 'package:clinic/features_employee/reviews/pages/reviews_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/employee_navbar_controller.dart';
import '../widgets/nav_bar_widget.dart';

class EmployeeNavBarPage extends GetView<EmployeeNavbarController> {
  const EmployeeNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmployeeNavbarController());
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const EmployeeNavBarWidget(),
        body: Obx(() {
          switch (controller.mainState.value) {
            case EmployeeMainLayoutState.invoices:
              return InvoicesPage();
            case EmployeeMainLayoutState.reports:
              return ReviewsPage();
            case EmployeeMainLayoutState.employees:
              return EmployeeReviews();
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
