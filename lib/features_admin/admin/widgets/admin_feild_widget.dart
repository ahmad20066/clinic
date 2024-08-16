import 'package:clinic/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminFeildWidget extends StatelessWidget {
  const AdminFeildWidget({
    required this.title,
    required this.textFeild,
  });

  final String title;
  final Widget textFeild;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.primaryColor,
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: REdgeInsets.all(15),
      child: Container(
        // height: 160.h,
        width: double.infinity,
        margin: REdgeInsets.all(15),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(title), SizedBox(height: 10.h), textFeild],
        ),
      ),
    );
  }
}
