import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/widgets/custom_button.dart';
import 'package:clinic/common/widgets/custom_textfield.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features/auth/controllers/register_controller.dart';
import 'package:clinic/features/auth/widgets/background_image.dart';
import 'package:clinic/features/auth/widgets/register/custom_radio_button.dart';
import 'package:clinic/features/auth/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      body: Stack(children: [
        Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: BackGroundImage()),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              TitleWidget(text: 'Sign Up And Start Exploring'),
              SizedBox(
                height: 30.h,
              ),
              CustomTextField(
                  textController: controller.nameController,
                  labelText: 'Name',
                  preIcon: Icons.person,
                  pMargin: 10,
                  hmargin: 30),
              CustomTextField(
                  textController: controller.emailController,
                  labelText: 'Email',
                  preIcon: Icons.email,
                  pMargin: 10,
                  hmargin: 30),
              CustomTextField(
                textController: controller.passwordController,
                labelText: 'Password',
                pMargin: 10,
                hmargin: 30,
                isPrivate: true,
                preIcon: Icons.lock_outline,
              ),
              CustomTextField(
                  textController: controller.confirmController,
                  action: TextInputAction.done,
                  isPrivate: true,
                  labelText: 'Confirm Password',
                  preIcon: Icons.check,
                  pMargin: 10,
                  hmargin: 30),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRadioButton(text: 'Doctor', buttonvalue: 1),
                  CustomRadioButton(
                    text: 'Admin',
                    buttonvalue: 2,
                    isCenter: true,
                  ),
                  CustomRadioButton(
                    text: 'Employee',
                    buttonvalue: 3,
                    isCenter: true,
                  ),
                  CustomRadioButton(text: 'Normal', buttonvalue: 0)
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Obx(() => controller.status.value == RequestStatus.loading
                  ? CustomLoader(
                      color: Colors.white,
                    )
                  : CustomButton(
                      onTap: () async {
                        controller.register();
                      },
                      height: 60,
                      width: 270,
                      text: controller.value.value == 1
                          ? 'Continue'
                          : 'Sign Up')),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
