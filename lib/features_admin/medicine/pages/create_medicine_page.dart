import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/utils/utils.dart';
import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/common/widgets/custom_appbar2.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/custom_textfield_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/medicine/controllers/create_medicine_controller.dart';
import 'package:clinic/features_admin/medicine/widgets/medicine_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateMedicinePage extends GetView<CreateMedicineController> {
  const CreateMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateMedicineController());
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        title: 'Add a Medicine',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Obx(
          () => controller.createMedicineRequestStatus.value ==
                  RequestStatus.loading
              ? const CustomLoader()
              : CustomButtonTwo(
                  title: 'Add',
                  icon: 'assets/svg/icons/add.svg',
                  isprefix: true,
                  onTap: () {
                    if (controller.dateController.selectedDate == null) {
                      CustomToasts.ErrorDialog('Please select a date');
                    }
                    if (controller.formKey.currentState!.validate() &&
                        controller.dateController.selectedDate != null) {
                      controller.createVaccine();
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
                MedicineFeildWidget(
                  title: 'Clinic ID',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.clinicIdController,
                    hintText: 'Enter Clinic ID',
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Feild required';
                      }
                      return null;
                    },
                  ),
                ),
                MedicineFeildWidget(
                  title: 'Name',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.nameController,
                    hintText: 'Enter name',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Feild required';
                      }
                      return null;
                    },
                  ),
                ),
                MedicineFeildWidget(
                  title: 'Description',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.descriptionController,
                    hintText: 'Enter Description',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Feild required';
                      }
                      return null;
                    },
                  ),
                ),
                MedicineFeildWidget(
                  title: 'Target Group',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.targetGroupController,
                    hintText: 'Enter Target Group',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Feild required';
                      }
                      return null;
                    },
                  ),
                ),
                MedicineFeildWidget(
                  title: 'Price',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.priceController,
                    keyboardType: TextInputType.number,
                    hintText: 'Enter Price',
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
                      Text('Date'),
                      SizedBox(height: 10.h),
                      SfDateRangePicker(
                        controller: controller.dateController,
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
