import 'package:clinic/data/enums/admin_main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../common/constants/app_colors.dart';
import '../controllers/nav_bar_controller.dart';
import 'nav_bar_item.dart';

class AdminNavBarWidget extends GetWidget<AdminNavBarController> {
  const AdminNavBarWidget({super.key});

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
                  svgImage: 'assets/svg/icons/clinic.svg',
                  title: "Clinics",
                  isSelected:
                      controller.mainState.value == AdminMainLayoutState.clinic,
                  onTap: () {
                    controller.setMainState(AdminMainLayoutState.clinic);
                  }),
              NavBarItem(
                  isSvg: true,
                  svgImage: 'assets/svg/icons/vaccine.svg',
                  title: "Vaccines",
                  isSelected: controller.mainState.value ==
                      AdminMainLayoutState.vaccine,
                  onTap: () {
                    controller.setMainState(AdminMainLayoutState.vaccine);
                  }),
              NavBarItem(
                  isSvg: true,
                  svgImage: 'assets/svg/icons/medicine.svg',
                  title: "Medicines",
                  isSelected: controller.mainState.value ==
                      AdminMainLayoutState.medicine,
                  onTap: () {
                    controller.setMainState(AdminMainLayoutState.medicine);
                  }),
              NavBarItem(
                  isSvg: true,
                  svgImage: 'assets/svg/icons/contract.svg',
                  title: "Contracts",
                  isSelected: controller.mainState.value ==
                      AdminMainLayoutState.contract,
                  onTap: () {
                    controller.setMainState(AdminMainLayoutState.contract);
                  }),
            ],
          ),
        ));
  }
}
