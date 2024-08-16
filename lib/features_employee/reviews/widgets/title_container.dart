import 'package:clinic/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleContainer extends StatelessWidget {
  final String text;
  TitleContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: AppColors.whiteColor, fontSize: 24.sp),
      ),
    );
  }
}
