import 'package:clinic/data/enums/admin_main_layout.dart';
import 'package:clinic/data/enums/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../common/constants/app_colors.dart';
import '../controllers/nav_bar_controller.dart';
import 'nav_bar_item.dart';

class NavBarWidget extends GetWidget<NavBarController> {
  const NavBarWidget({super.key});

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
                  title: "Home",
                  isSelected:
                      controller.mainState.value == MainLayoutState.home,
                  onTap: () {
                    controller.setMainState(MainLayoutState.home);
                  }),
              NavBarItem(
                  icon: Icons.search,
                  title: "Search",
                  isSelected:
                      controller.mainState.value == MainLayoutState.search,
                  onTap: () {
                    controller.setMainState(MainLayoutState.search);
                  }),
              NavBarItem(
                  icon: Icons.settings,
                  title: "Settings",
                  isSelected:
                      controller.mainState.value == MainLayoutState.settings,
                  onTap: () {
                    controller.setMainState(MainLayoutState.settings);
                  }),
            ],
          ),
        ));
  }
}
