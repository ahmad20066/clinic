import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/models/admin_model.dart';
import 'package:clinic/features_admin/admin/controllers/admin_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminWidget extends StatelessWidget {
  AdminWidget({required this.model});
  AdminModel model;

  final controller = Get.find<AdminPageController>();

  RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.primaryColor,
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: REdgeInsets.all(15),
      child: Container(
        // height: 160.h,
        width: double.infinity,
        margin: REdgeInsets.all(15),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${model.id}'),
            SizedBox(height: 15.h),
            Text('Name: ${model.name}'),
            SizedBox(height: 15.h),
            Text('Address: ${model.address}'),
            SizedBox(height: 15.h),
            Text('Phone number: ${model.phone}'),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtonTwo(
                  title: 'Edit',
                  onTap: () {
                    Get.toNamed(AppRoute.editAdminPage, arguments: model);
                  },
                  width: 100,
                  isprefix: true,
                  icon: 'assets/svg/icons/edit.svg',
                ),
                Obx(
                  () => isLoading.value
                      ? const CustomLoader(color: AppColors.redColor)
                      : CustomButtonTwo(
                          title: 'Delete',
                          onTap: () {
                            controller.deleteContract(model.id!, isLoading);
                          },
                          width: 100,
                          isprefix: true,
                          buttonColor: AppColors.redColor,
                          icon: 'assets/svg/icons/delete.svg',
                        ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
