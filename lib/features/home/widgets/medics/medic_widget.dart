import 'package:clinic/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicWidget extends StatelessWidget {
  final String text;
  const MedicWidget({super.key, required this.text});

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
        radius: 50.sp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.medication,
              size: 40.sp,
            ),
            Text(
              text,
              style: TextStyle(color: AppColors.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
