import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/common/widgets/custom_appbar2.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/custom_textfield_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/clinic/controllers/create_clinic_controller.dart';
import 'package:clinic/features_admin/clinic/widgets/clinic_feilds_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateClinicPage extends GetView<CreateClinicController> {
  const CreateClinicPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateClinicController());
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        title: 'Add a clinic',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Obx(
          () => controller.createClinicRequestStatus.value ==
                  RequestStatus.loading
              ? CustomLoader()
              : CustomButtonTwo(
                  title: 'Add',
                  icon: 'assets/svg/icons/add.svg',
                  isprefix: true,
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.createClinic();
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
          child: Column(
            children: [
              ClinicFeildsWidget(
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
              ClinicFeildsWidget(
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
              )
            ],
          ),
        ),
      ),
    ));
  }
}
