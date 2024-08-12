import 'package:clinic/data/enums/admin_main_layout.dart';
import 'package:clinic/data/enums/doctor_main_layout.dart';
import 'package:clinic/data/enums/main_layout.dart';
import 'package:clinic/features/main_layout/widgets/nav_bar_item.dart';
import 'package:clinic/features_doctor/doctor_main_layout/controllers/doctor_navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../common/constants/app_colors.dart';

class DoctorNavBarWidget extends GetWidget<DoctorNavbarController> {
  const DoctorNavBarWidget({super.key});

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
                  icon: Icons.home,
                  title: "Appointments",
                  isSelected: controller.mainState.value ==
                      DoctorMainLayoutState.appointments,
                  onTap: () {
                    controller.setMainState(DoctorMainLayoutState.appointments);
                  }),
              NavBarItem(
                  icon: Icons.vaccines,
                  title: "Vaccine",
                  isSelected: controller.mainState.value ==
                      DoctorMainLayoutState.vaccineCard,
                  onTap: () {
                    controller.setMainState(DoctorMainLayoutState.vaccineCard);
                  }),
            ],
          ),
        ));
  }
}
