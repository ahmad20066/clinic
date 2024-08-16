import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/custom_drop_down.dart';
import 'package:clinic/common/widgets/custom_textfield_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/employee_model.dart';
import 'package:clinic/features_admin/contract/controllers/create_contract_controller.dart';
import 'package:clinic/features_admin/contract/widgets/contract_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateContractPage extends GetView<CreateContractController> {
  const CreateContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateContractController());
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        title: 'Create a contract',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Obx(
          () => controller.createContractRequestStatus.value ==
                  RequestStatus.loading
              ? const CustomLoader()
              : CustomButtonTwo(
                  title: 'Add',
                  icon: 'assets/svg/icons/add.svg',
                  isprefix: true,
                  onTap: () {
                    if (controller.openingDateController.selectedDate == null ||
                        controller.contractDateController.selectedDate ==
                            null) {
                      CustomToasts.ErrorDialog('Please select a date');
                    }
                    if (controller.selectedEmployee.value == null) {
                      CustomToasts.ErrorDialog('Please select an employee');
                    }
                    if (controller.formKey.currentState!.validate() &&
                        controller.openingDateController.selectedDate != null &&
                        controller.contractDateController.selectedDate !=
                            null &&
                        controller.selectedEmployee.value != null) {
                      controller.createContract();
                    }
                  },
                ),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Employee'),
                      Obx(
                        () => controller.getEmployeeRequestStatus.value ==
                                RequestStatus.loading
                            ? const CustomLoader()
                            : CustomDropdownButton(
                                value: controller.selectedEmployee.value,
                                underline: const SizedBox.shrink(),
                                items: controller.employees
                                    .map((EmployeeModel employee) {
                                  return DropdownMenuItem(
                                    value: employee,
                                    child: Text(employee.name!),
                                  );
                                }).toList(),
                                dropdownColor: AppColors.primaryColor,
                                onChanged: (v) {
                                  controller.selectEmployee(v.id!);
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                ContractFeildWidget(
                  title: 'Salary',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.salaryController,
                    keyboardType: TextInputType.number,
                    hintText: 'Enter Salary',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Feild required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Contract Date'),
                      SizedBox(height: 10.h),
                      SfDateRangePicker(
                        controller: controller.contractDateController,
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
                SizedBox(height: 15.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Opening Date'),
                      SizedBox(height: 10.h),
                      SfDateRangePicker(
                        controller: controller.openingDateController,
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
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
