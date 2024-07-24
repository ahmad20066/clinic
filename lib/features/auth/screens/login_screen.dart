import 'dart:math';

import 'package:clinic/common/widgets/custom_button.dart';
import 'package:clinic/common/widgets/custom_textfield.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features/auth/controllers/login_controller.dart';
import 'package:clinic/features/auth/widgets/background_image.dart';
import 'package:clinic/features/auth/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:animated_background/animated_background.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: BackGroundImage()),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                TitleWidget(text: 'LET`S SIGN YOU IN'),
                const SizedBox(
                  height: 15,
                  width: double.infinity,
                ),
                Align(
                  alignment: const Alignment(-0.5, 1),
                  child: Container(
                    width: 230.w,
                    child: Text(
                      'Wlecome back, you`ve been missed',
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                CustomTextField(
                    textController: controller.emailController,
                    labelText: 'Email',
                    preIcon: Icons.email,
                    pMargin: 20,
                    hmargin: 30),
                CustomTextField(
                  textController: controller.passwordController,
                  labelText: 'Password',
                  pMargin: 20,
                  action: TextInputAction.done,
                  hmargin: 30,
                  isPrivate: true,
                  preIcon: Icons.lock_outline,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        side: BorderSide(color: Colors.white, width: 2),
                        activeColor: Colors.white,
                        // checkColor: GLobalVariables.baseColor,
                        value: true,
                        onChanged: (value) {}),
                    Text(
                      'Keep Me Signed In',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Obx(() => controller.status.value == RequestStatus.loading
                    ? CustomLoader(
                        color: Colors.white,
                      )
                    : CustomButton(
                        onTap: () async {
                          controller.login();
                        },
                        height: 60,
                        width: 270,
                        text: 'Log In')),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
