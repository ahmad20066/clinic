import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/utils/utils.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/models/contract_model.dart';
import 'package:clinic/features_admin/contract/controllers/contacts_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContractWidget extends StatelessWidget {
  ContractWidget({required this.model});
  ContractModel model;

  final controller = Get.find<ContractsPageController>();

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
            Text('Employee ID: ${model.employeeId}'),
            SizedBox(height: 15.h),
            Text('Salary: ${model.salary}'),
            SizedBox(height: 15.h),
            Text(
                'Opening Date: ${Utils.dateFormat(DateTime.parse(model.openingDate!), expression: 'yyyy-MM-dd')}'),
            SizedBox(height: 15.h),
            Text(
                'Contract Date: ${Utils.dateFormat(DateTime.parse(model.contractDate!), expression: 'yyyy-MM-dd')}'),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtonTwo(
                  title: 'Edit',
                  onTap: () {
                    Get.toNamed(AppRoute.editContractPage, arguments: model);
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
