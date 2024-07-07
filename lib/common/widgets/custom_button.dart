import 'package:clinic/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;

  final VoidCallback onTap;
  final String? text;
  final EdgeInsets margin;
  bool isFill;
  CustomButton(
      {Key? key,
      required this.onTap,
      required this.height,
      required this.width,
      this.margin = EdgeInsets.zero,
      this.isFill = false,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: margin,
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isFill ? AppColors.primaryColor : Colors.white,
          ),
          child: Text(
            text!,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: isFill ? Colors.white : AppColors.primaryColor),
          )),
    );
  }
}
