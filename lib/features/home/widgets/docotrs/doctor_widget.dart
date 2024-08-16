import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorWidget extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.doctorDetailsPageUrl);
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
                doctor.name,
                style: TextStyle(color: AppColors.primaryColor),
              ),
              Text(
                doctor.section!.name,
                style: TextStyle(color: AppColors.primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
