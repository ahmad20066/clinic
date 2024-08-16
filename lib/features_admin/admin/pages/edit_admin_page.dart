import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/custom_textfield_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/admin/controllers/edit_admin_controller.dart';
import 'package:clinic/features_admin/admin/widgets/admin_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditAdminPage extends GetView<EditAdminController> {
  const EditAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditAdminController());
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Admin',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Obx(
          () => controller.updateAdminRequestStatus.value ==
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
                AdminFeildWidget(
                  title: 'Name',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.nameController,
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
