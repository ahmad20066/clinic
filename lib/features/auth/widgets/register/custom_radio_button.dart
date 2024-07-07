import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/features/auth/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRadioButton extends StatelessWidget {
  final String text;
  final int buttonvalue;
  const CustomRadioButton({super.key, required this.text, required this.buttonvalue});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Obx(() => OutlinedButton(
      onPressed: () {
        controller.value.value = buttonvalue;
      },
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(15),
        backgroundColor:
            controller.value.value == buttonvalue ? Colors.white : AppColors.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft:
                  buttonvalue == 0 ? Radius.circular(0) : Radius.circular(15),
              bottomLeft:
                  buttonvalue == 0 ? Radius.circular(0) : Radius.circular(15),
              topRight:
                  buttonvalue == 1 ? Radius.circular(0) : Radius.circular(15),
              bottomRight:
                  buttonvalue == 1 ? Radius.circular(0) : Radius.circular(15),
            ),
            side: BorderSide(
                color: controller.value.value == buttonvalue
                    ? Colors.white
                    : AppColors.primaryColor)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color:
              (controller.value.value == buttonvalue) ? AppColors.primaryColor : Colors.white,
        ),
      ),
    ))  ;
  }
}