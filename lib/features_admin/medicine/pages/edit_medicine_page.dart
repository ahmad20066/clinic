import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/common/widgets/custom_appbar2.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/custom_textfield_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/medicine/controllers/edit_medicine_controller.dart';
import 'package:clinic/features_admin/medicine/widgets/medicine_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditMedicinePage extends GetView<EditMedicineController> {
  const EditMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditMedicineController());
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Medicine',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Obx(
          () => controller.updateMedicineRequestStatus.value ==
                  RequestStatus.loading
              ? const CustomLoader()
              : CustomButtonTwo(
                  title: 'Save',
                  onTap: () {
                    controller.updateMedicine();
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
                MedicineFeildWidget(
                  title: 'Name',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.nameController,
                    hintText: '',
                  ),
                ),
                SizedBox(height: 15.h),
                MedicineFeildWidget(
                  title: 'Description',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.descriptionController,
                    hintText: '',
                  ),
                ),
                SizedBox(height: 15.h),
                MedicineFeildWidget(
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
