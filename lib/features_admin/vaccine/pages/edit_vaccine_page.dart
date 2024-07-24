import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/custom_textfield_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/vaccine/controllers/edit_vaccine_controller.dart';
import 'package:clinic/features_admin/vaccine/widgets/vaccine_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class EditVaccinePage extends GetView<EditVaccineController> {
  const EditVaccinePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditVaccineController());
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Vaccine',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Obx(
          () => controller.updateVaccineRequestStatus.value ==
                  RequestStatus.loading
              ? const CustomLoader()
              : CustomButtonTwo(
                  title: 'Save',
                  onTap: () {
                    controller.updateVaccine();
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
                VaccineFeildWidget(
                  title: 'Name',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.nameController,
                    hintText: '',
                  ),
                ),
                SizedBox(height: 15.h),
                VaccineFeildWidget(
                  title: 'Description',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.descriptionController,
                    hintText: '',
                  ),
                ),
                SizedBox(height: 15.h),
                VaccineFeildWidget(
                  title: 'Target Group',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.targetGroupController,
                    hintText: '',
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
