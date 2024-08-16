import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/custom_drop_down.dart';
import 'package:clinic/data/models/clinic_model.dart';
import 'package:clinic/features_employee/reviews/controllers/reviews_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ReviewsBottomSheet extends StatelessWidget {
  ReviewsBottomSheet({super.key});

  final controller = Get.find<ReviewsController>();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            padding: REdgeInsets.all(15),
            height: 700.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Clinic'),
                      Obx(
                        () => CustomDropdownButton(
                          value: controller.selectedClinic.value,
                          underline: const SizedBox.shrink(),
                          items: controller.clinics.map((ClinicModel clinic) {
                            return DropdownMenuItem(
                              value: clinic,
                              child: Text(clinic.name!),
                            );
                          }).toList(),
                          dropdownColor: AppColors.primaryColor,
                          onChanged: (v) {
                            controller.selectClinic(v.id!);
                          },
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date'),
                      SizedBox(height: 10.h),
                      SfDateRangePicker(
                        controller: controller.dateController,
                        selectionColor: AppColors.primaryColor,
                        todayHighlightColor: AppColors.primaryColor,
                        monthCellStyle: const DateRangePickerMonthCellStyle(
                          todayTextStyle: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomButtonTwo(
                    title: 'Search',
                    onTap: () {
                      controller.getReviews();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
