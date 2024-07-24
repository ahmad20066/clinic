import 'package:clinic/data/enums/admin_main_layout.dart';
import 'package:clinic/data/enums/main_layout.dart';
import 'package:clinic/features/home/pages/home_page.dart';
import 'package:clinic/features/search/pages/search_page.dart';
import 'package:clinic/features/settings/screens/settings_page.dart';
import 'package:clinic/features_admin/clinic/pages/clinic_page.dart';
import 'package:clinic/features_admin/medicine/pages/medicines_page.dart';
import 'package:clinic/features_admin/vaccine/pages/vaccines_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../controllers/nav_bar_controller.dart';
import '../widgets/nav_bar_widget.dart';

class NavBarPage extends GetView<NavBarController> {
  const NavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavBarWidget(),
        body: Obx(() {
          switch (controller.mainState.value) {
            case MainLayoutState.home:
              return HomePage();
            case MainLayoutState.settings:
              return SettingsPage();
            case MainLayoutState.search:
              return SearchPage();
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
