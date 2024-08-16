import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/data/models/medic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MedicWidget extends StatelessWidget {
  final MedicModel medicine;
  const MedicWidget({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.medicinePageUrl, arguments: medicine);
      },
      child: Container(
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
                medicine.name,
                style: TextStyle(color: AppColors.primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
