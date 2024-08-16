import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/custom_textfield_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/admin/controllers/create_admin_controller.dart';
import 'package:clinic/features_admin/admin/widgets/admin_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateAdminPage extends GetView<CreateAdminController> {
  const CreateAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateAdminController());
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        title: 'Create a contract',
        hasLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Obx(
          () =>
              controller.createAdminRequestStatus.value == RequestStatus.loading
                  ? const CustomLoader()
                  : CustomButtonTwo(
                      title: 'Add',
                      icon: 'assets/svg/icons/add.svg',
                      isprefix: true,
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.createAdmin();
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
                AdminFeildWidget(
                  title: 'Name',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.nameController,
                    hintText: 'Enter Name',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Feild required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                AdminFeildWidget(
                  title: 'Address',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.addressController,
                    hintText: 'Enter Address',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Feild required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                AdminFeildWidget(
                  title: 'Phone',
                  textFeild: CustomTextFieldTwo(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.number,
                    hintText: 'Enter Address',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Feild required';
                      }
                      return null;
                    },
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
