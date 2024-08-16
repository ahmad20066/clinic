import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/custom_drop_down.dart';
import 'package:clinic/common/widgets/custom_textfield_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/clinic_model.dart';
import 'package:clinic/features_admin/clinic/controllers/clinic_controller.dart';
import 'package:clinic/features_admin/vaccine/controllers/create_vaccine_controller.dart';
import 'package:clinic/features_admin/vaccine/widgets/vaccine_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateVaccinePage extends GetView<CreateVaccineController> {
  const CreateVaccinePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateVaccineController());
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        title: 'Add a Vaccine',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Obx(
          () => controller.createVaccineRequestStatus.value ==
                  RequestStatus.loading
              ? CustomLoader()
              : CustomButtonTwo(
                  title: 'Add',
                  icon: 'assets/svg/icons/add.svg',
                  isprefix: true,
                  onTap: () {
                    if (controller.dateController.selectedDate == null) {
                      CustomToasts.ErrorDialog('Please select a date');
                    }
                    if (controller.selectedClinic.value == null) {
                      CustomToasts.ErrorDialog('Please select a Clinic');
                    }
                    if (controller.formKey.currentState!.validate() &&
                        controller.dateController.selectedDate != null &&
                        controller.selectedClinic.value != null) {
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
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Clinic'),
                      Obx(
                        () => CustomDropdownButton(
                          value: controller.selectedClinic.value,
                          underline: const SizedBox.shrink(),
                          items: Get.find<ClinicController>()
                              .clinics
                              .map((ClinicModel clinic) {
                            return DropdownMenuItem(
                              value: clinic,
                              child: Text(clinic.name!),
                            );
                          }).toList(),
                          dropdownColor: AppColors.primaryColor,
                          onChanged: (v) {
                            controller.selectClinic(v.id!);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                VaccineFeildWidget(
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
                VaccineFeildWidget(
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
                VaccineFeildWidget(
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
                SizedBox(height: 15.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Date'),
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
