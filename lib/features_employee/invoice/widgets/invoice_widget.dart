import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/data/models/employee_review.dart';
import 'package:clinic/data/models/invoice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceWidget extends StatelessWidget {
  InvoiceModel model;
  InvoiceWidget({
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
            Text('Order Med ID: ${model.orderMedId}'),
            SizedBox(height: 15.h),
            Text('Price: ${model.price} SYP'),
            SizedBox(height: 15.h),
            Text('Date: ${model.date!.substring(0, 10)}'),
          ],
        ),
      ),
    );
  }
}
