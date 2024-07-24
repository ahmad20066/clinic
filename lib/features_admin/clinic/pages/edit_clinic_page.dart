import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/custom_textfield.dart';
import 'package:clinic/common/widgets/custom_textfield_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/clinic/controllers/edit_clinic_controller.dart';
import 'package:clinic/features_admin/clinic/widgets/clinic_feilds_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditClinicPage extends GetView<EditClinicController> {
  const EditClinicPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditClinicController());
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Clinic',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Obx(
          () => controller.updateClinicRequestStatus.value ==
                  RequestStatus.loading
              ? CustomLoader()
              : CustomButtonTwo(
                  title: 'Save',
                  onTap: () {
                    controller.updateClinic();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClinicFeildsWidget(
                title: 'Name',
                textFeild: CustomTextFieldTwo(
                  controller: controller.nameController,
                  hintText: '',
                ),
              ),
              SizedBox(height: 15.h),
              ClinicFeildsWidget(
                title: 'Description',
                textFeild: CustomTextFieldTwo(
                  controller: controller.descriptionController,
                  hintText: '',
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
