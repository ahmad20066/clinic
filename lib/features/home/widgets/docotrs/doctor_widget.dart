import 'package:clinic/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorWidget extends StatelessWidget {
  final String text;
  final String section;

  const DoctorWidget({super.key, required this.text, required this.section});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              blurRadius: 10, color: AppColors.primaryColor, spreadRadius: 5)
        ],
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 80.sp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.medical_information,
              size: 70.sp,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              text,
              style: TextStyle(color: AppColors.primaryColor),
            ),
            Text(
              section,
              style: TextStyle(color: AppColors.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
