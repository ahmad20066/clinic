import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/data/models/employee_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmpReviewWidget extends StatelessWidget {
  EmployeeReviewModel model;
  EmpReviewWidget({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.primaryColor,
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: REdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        margin: REdgeInsets.all(15),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Employee name: ${model.name}'),
            SizedBox(height: 15.h),
            Text('Gender: ${model.gender}'),
            SizedBox(height: 15.h),
            Text('Salary: ${model.sallary} SYP'),
            SizedBox(height: 15.h),
            Text('Opening date ${model.openingDate!.substring(0,10)}'),
            SizedBox(height: 15.h),
            Text('Contract date: ${model.contractDate!.substring(0,10)}'),
          ],
        ),
      ),
    );
  }
}
