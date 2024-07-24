import 'package:clinic/common/widgets/custom_button.dart';
import 'package:clinic/common/widgets/custom_textfield.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features/auth/controllers/admin_form_controller.dart';
import 'package:clinic/features/auth/widgets/background_image.dart';
import 'package:clinic/features/auth/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminFormScreen extends StatelessWidget {
  const AdminFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminFormController());
    return Scaffold(
      body: Stack(children: [
        BackGroundImage(),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80.h,
              ),
              TitleWidget(text: 'TELL US MORE ABOUT YOURSELF'),
              SizedBox(
                height: 20,
              ),
              // CircleAvatar(
              //   radius: 55.r,
              //   backgroundColor: Colors.white,
              //   backgroundImage: controller.image.value == null
              //       ? const AssetImage('assets/images/an.png')
              //       : FileImage(controller.image.value!) as ImageProvider,
              // ),
              // TextButton.icon(
              //     onPressed: () async {
              //       final file = await ImagePicker()
              //           .pickImage(source: ImageSource.camera);
              //       if (file == null) {
              //         return;
              //       }

              //     },
              //     icon: Icon(
              //       Icons.image,
              //       color: Colors.white,
              //     ),
              //     label: Text(
              //       'Pick a profile image',
              //       style: TextStyle(color: Colors.white),
              //     )),
              SizedBox(
                height: 40.h,
              ),
              CustomTextField(
                  preIcon: Icons.numbers,
                  textController: controller.phoneController,
                  labelText: 'Phone Number',
                  pMargin: 10,
                  hmargin: 30),
              CustomTextField(
                  preIcon: Icons.location_on_outlined,
                  textController: controller.addressController,
                  labelText: 'Address',
                  pMargin: 10,
                  hmargin: 30),

              SizedBox(
                height: 60,
              ),
              Obx(() => controller.status.value == RequestStatus.loading
                  ? CustomLoader(
                      color: Colors.white,
                    )
                  : CustomButton(
                      onTap: () async {
                        controller.createAdmin();
                      },
                      height: 60.h,
                      width: 270.w,
                      text: 'Sign Up')),
            ],
          ),
        )
      ]),
    );
  }
}
