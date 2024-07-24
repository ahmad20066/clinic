import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/features/medics/controllers/medic_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MedicDetails extends StatelessWidget {
  const MedicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MedicDetailsController());
    return Scaffold(
      body: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: REdgeInsets.all(15),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: 130.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.w,
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
                            controller.medicine!.name,
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Spacer(),
                          Text(
                            controller.medicine!.target_group,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
