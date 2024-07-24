import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/custom_textfield_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/contract/controllers/edit_contract_controller.dart';
import 'package:clinic/features_admin/contract/widgets/contract_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditContractPage extends GetView<EditContractController> {
  const EditContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditContractController());
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Contract',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Obx(
          () => controller.updateContractRequestStatus.value ==
                  RequestStatus.loading
              ? const CustomLoader()
              : CustomButtonTwo(
                  title: 'Save',
                  onTap: () {
                    controller.updateContract();
                  },
                ),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.all(15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContractFeildWidget(
                  title: 'Salary',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.salaryController,
                    hintText: '',
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Opening contract Date'),
                      SizedBox(height: 10.h),
                      SfDateRangePicker(
                        controller: controller.openingDateController,
                        initialDisplayDate:
                            controller.openingDateController.displayDate,
                        selectionColor: AppColors.primaryColor,
                        todayHighlightColor: AppColors.primaryColor,
                        monthCellStyle: const DateRangePickerMonthCellStyle(
                          todayTextStyle: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
