import 'package:clinic/data/enums/employee_main_layout.dart';
import 'package:clinic/features/main_layout/widgets/nav_bar_item.dart';
import 'package:clinic/features_employee/main_layout/controllers/employee_navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../common/constants/app_colors.dart';

class EmployeeNavBarWidget extends GetWidget<EmployeeNavbarController> {
  const EmployeeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72.h,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(252, 252, 252, 1),
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                color: AppColors.blackColor.withOpacity(0.5),
                spreadRadius: 0),
          ],
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavBarItem(
                  isSvg: true,
                  svgImage: 'assets/svg/icons/report.svg',
                  title: "Reports",
                  isSelected: controller.mainState.value ==
                      EmployeeMainLayoutState.reports,
                  onTap: () {
                    controller.setMainState(EmployeeMainLayoutState.reports);
                  }),
                  NavBarItem(
                  isSvg: true,
                  svgImage: 'assets/svg/icons/employee.svg',
                  title: "Employees",
                  isSelected: controller.mainState.value ==
                      EmployeeMainLayoutState.employees,
                  onTap: () {
                    controller.setMainState(EmployeeMainLayoutState.employees);
                  }),
              NavBarItem(
                  isSvg: true,
                  svgImage: 'assets/svg/icons/invoice.svg',
                  title: "Invoices",
                  isSelected: controller.mainState.value ==
                      EmployeeMainLayoutState.invoices,
                  onTap: () {
                    controller.setMainState(EmployeeMainLayoutState.invoices);
                  }),
              
              // NavBarItem(
              //     isSvg: true,
              //     svgImage: 'assets/svg/icons/admin.svg',
              //     // svgHeight: 25,
              //     title: "Admin",
              //     isSelected:
              //         controller.mainState.value == AdminMainLayoutState.admin,
              //     onTap: () {
              //       controller.setMainState(AdminMainLayoutState.admin);
              //     }),
              // NavBarItem(
              //     isSvg: true,
              //     svgImage: 'assets/svg/icons/medicine.svg',
              //     title: "Medicines",
              //     isSelected: controller.mainState.value ==
              //         AdminMainLayoutState.medicine,
              //     onTap: () {
              //       controller.setMainState(AdminMainLayoutState.medicine);
              //     }),
              // NavBarItem(
              //     isSvg: true,
              //     svgImage: 'assets/svg/icons/contract.svg',
              //     title: "Contracts",
              //     isSelected: controller.mainState.value ==
              //         AdminMainLayoutState.contract,
              //     onTap: () {
              //       controller.setMainState(AdminMainLayoutState.contract);
              //     }),
            ],
          ),
        ));
  }
}
