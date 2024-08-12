// views/profile_page.dart
import 'package:clinic/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinic/features/settings/controllers/settings_controller.dart';
import 'package:clinic/common/widgets/custom_textfield.dart';

class SettingsPage extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.primaryColor,
            height: MediaQuery.of(context).size.height / 4,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                CircleAvatar(
                  radius: 70.r,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage('assets/placeholder.png'), // Placeholder image
                  child: Icon(
                    Icons.person,
                    size: 70.sp,
                    color: AppColors.primaryColor,
                  ), // Icon if image is not available
                ),
                SizedBox(height: 35.h),

                // Name Field with Edit Icon
                Obx(() => Row(
                      children: [
                        Expanded(
                          child: controller.isEditingName.value
                              ? CustomTextField(
                                  textController: controller.nameController,
                                  labelText: 'Name',
                                  pMargin: 10,
                                  hmargin: 0,
                                  preIcon: Icons.person,
                                  type: TextInputType.name,
                                  action: TextInputAction.done,
                                  onTap: () {},
                                  readOnly: false,
                                )
                              : Text(
                                  controller.nameController.text,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.primaryColor),
                                ),
                        ),
                        IconButton(
                          icon: Icon(controller.isEditingName.value
                              ? Icons.check
                              : Icons.edit),
                          onPressed: () async {
                            if (controller.isEditingName.value) {
                              String newName = controller.nameController.text;
                              await controller.updateProfile(
                                  newName: newName,
                                  newEmail: controller.emailController.text);
                            }
                            controller.isEditingName.value =
                                !controller.isEditingName.value;
                          },
                        ),
                      ],
                    )),

                Obx(() => Row(
                      children: [
                        Expanded(
                          child: controller.isEditingEmail.value
                              ? CustomTextField(
                                  textController: controller.emailController,
                                  labelText: 'Email',
                                  pMargin: 10,
                                  hmargin: 0,
                                  preIcon: Icons.email,
                                  type: TextInputType.emailAddress,
                                  action: TextInputAction.done,
                                  onTap: () {},
                                  readOnly: false,
                                )
                              : Text(
                                  controller.emailController.text,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.primaryColor),
                                ),
                        ),
                        IconButton(
                          icon: Icon(controller.isEditingEmail.value
                              ? Icons.check
                              : Icons.edit),
                          onPressed: () async {
                            if (controller.isEditingEmail.value) {
                              String newEmail = controller.emailController.text;
                              await controller.updateProfile(
                                  newName: controller.nameController.text,
                                  newEmail: newEmail);
                            }
                            controller.isEditingEmail.value =
                                !controller.isEditingEmail.value;
                          },
                        ),
                      ],
                    )),
                Spacer(),
                ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.red,
                  ),
                  onTap: () {
                    controller.logout();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
