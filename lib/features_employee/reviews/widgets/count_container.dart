import 'package:clinic/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountContainer extends StatelessWidget {
  final String text;
  final int count;
  const CountContainer({required this.text, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 100.h,
      padding: REdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(color: AppColors.whiteColor),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            count.toString(),
            style: TextStyle(color: AppColors.whiteColor, fontSize: 22.sp),
          ),
        ],
      ),
    );
  }
}
