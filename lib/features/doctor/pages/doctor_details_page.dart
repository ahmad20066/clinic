import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/utils/utils.dart';
import 'package:clinic/common/widgets/custom_button.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features/doctor/controllers/doctor_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorDetailsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: REdgeInsets.all(15),
              child: Container(
                alignment: Alignment.center,
                height: 130.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: BackButton(),
                    ),
                    Spacer(),
                    Text(
                      controller.doctor!.name,
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      controller.doctor!.section!.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 200.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(controller.doctor!.address + " years old"),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 200.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(controller.doctor!.address),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 200.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.phone),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(controller.doctor!.phone_number),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/doctor.jpg")),
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 100.w,
                  child: Divider(
                    // endIndent: 100.w,
                    color: AppColors.primaryColor,
                    thickness: 3,
                    height: 10.h,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Section',
                  style:
                      TextStyle(color: AppColors.primaryColor, fontSize: 28.sp),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Align(
                alignment: Alignment(-0.8, 1),
                child: Text(
                  controller.doctor!.section!.name,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 5.h,
            ),
            Align(
                alignment: Alignment(-0.8, 1),
                child: Text(
                  controller.doctor!.section!.description,
                  style:
                      TextStyle(color: AppColors.primaryColor, fontSize: 20.sp),
                )),
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 100.w,
                  child: Divider(
                    // endIndent: 100.w,
                    color: AppColors.primaryColor,
                    thickness: 3,
                    height: 10.h,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Working Hours',
                  style:
                      TextStyle(color: AppColors.primaryColor, fontSize: 28.sp),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Align(
                alignment: Alignment(-0.8, 1),
                child: Text(
                  controller.doctor!.working_hour,
                  style:
                      TextStyle(color: AppColors.primaryColor, fontSize: 20.sp),
                )),
            SizedBox(
              height: 30.h,
            ),
            Obx(() => controller.status.value == RequestStatus.loading
                ? CustomLoader()
                : CustomButton(
                    onTap: () async {
                      final result = await Get.dialog(AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Get.back(result: false);
                                },
                                child: Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  Get.back(result: true);
                                },
                                child: Text("Ok")),
                          ],
                          content: Container(
                            height: 340.h,
                            width: 200.w,
                            child: Column(
                              children: [
                                SfDateRangePicker(
                                  controller: controller.dateController,
                                  selectionColor: AppColors.primaryColor,
                                  todayHighlightColor: AppColors.primaryColor,
                                  enablePastDates: false,
                                  monthCellStyle:
                                      const DateRangePickerMonthCellStyle(
                                    todayTextStyle: TextStyle(
                                      color: AppColors
                                          .primaryColor, // Set the color for today's date text
                                    ),
                                  ),
                                  onSelectionChanged: (va) {
                                    // print(controller.dateController.selectedDate);
                                    String date = Utils.dateFormat(
                                        controller.dateController.selectedDate!,
                                        expression: 'yyyy-MM-dd');
                                    print(date);
                                    // Utils.dateFormat(va.value);
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          )));
                      if (result) {
                        controller.createAppointment();
                      }
                    },
                    height: 60.h,
                    width: 250.w,
                    text: "Book An Appointment",
                    isFill: true,
                  )),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
