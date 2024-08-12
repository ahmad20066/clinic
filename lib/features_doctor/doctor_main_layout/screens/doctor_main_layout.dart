import 'package:clinic/data/enums/doctor_main_layout.dart';
import 'package:clinic/data/enums/main_layout.dart';
import 'package:clinic/features/main_layout/widgets/nav_bar_widget.dart';
import 'package:clinic/features_doctor/appointments/pages/appointments_page.dart';
import 'package:clinic/features_doctor/doctor_main_layout/controllers/doctor_navbar_controller.dart';
import 'package:clinic/features_doctor/doctor_main_layout/widgets/doctor_navbar.dart';
import 'package:clinic/features_doctor/vaccine_card/pages/create_vaccine_card_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorMainLayout extends StatelessWidget {
  const DoctorMainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorNavbarController());
    return Scaffold(
      bottomNavigationBar: DoctorNavBarWidget(),
      body: Obx(() {
        switch (controller.mainState.value) {
          case DoctorMainLayoutState.appointments:
            return AppointmentsPAge();
          case DoctorMainLayoutState.vaccineCard:
          default:
            return CreateVaccineCardPage();
        }
      }),
    );
  }
}
