import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/models/medicine_model.dart';
import 'package:clinic/features_admin/medicine/controllers/medicines_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MedicineWidget extends StatelessWidget {
  MedicineWidget({required this.model});
  MedicineModel model;

  final controller = Get.find<MedicinesPageController>();

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
            Text('Name: ${model.name}'),
            SizedBox(height: 15.h),
            Text('Target gourp: ${model.targetGroup}'),
            SizedBox(height: 15.h),
            Text('Description: ${model.description}'),
            SizedBox(height: 15.h),
            Text('Price: ${model.price} SYR'),
            SizedBox(height: 15.h),
            Text('Clinic ID: ${model.clinicId}'),
            SizedBox(height: 15.h),
            Text('Date added: ${model.date}'),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtonTwo(
                  title: 'Edit',
                  onTap: () {
                    Get.toNamed(AppRoute.editMedicinePage, arguments: model);
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
                            controller.deleteMedicine(model.id!, isLoading);
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
