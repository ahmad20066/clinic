import 'package:clinic/data/enums/admin_main_layout.dart';
import 'package:clinic/features_admin/clinic/pages/clinic_page.dart';
import 'package:clinic/features_admin/medicine/pages/medicines_page.dart';
import 'package:clinic/features_admin/vaccine/pages/vaccines_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../controllers/nav_bar_controller.dart';
import '../widgets/nav_bar_widget.dart';

class AdminNavBarPage extends GetView<AdminNavBarController> {
  const AdminNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminNavBarController());
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: AdminNavBarWidget(),
        body: Obx(() {
          switch (controller.mainState.value) {
            case AdminMainLayoutState.clinic:
              return ClinicPage();
            case AdminMainLayoutState.vaccine:
              return VaccinesPage();
            case AdminMainLayoutState.medicine:
             return MedicinesPage();
            // case MainLayouState.wishlists:
            //   return CartPage();
            // case MainLayouState.profile:
            //   return SettingsPage();
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
