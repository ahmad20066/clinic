import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/widgets/custom_appbar2.dart';
import 'package:clinic/common/widgets/custom_button.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features/auth/widgets/title_widget.dart';
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
          SizedBox(
            height: 50.h,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                    width: 30.w,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/medicine.jpg")),
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
                'Description',
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
                controller.medicine!.description,
                style:
                    TextStyle(color: AppColors.primaryColor, fontSize: 20.sp),
              )),
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove,
                    color: Colors.red,
                  )),
              SizedBox(
                width: 20.w,
              ),
              Text(
                controller.quantity.toString(),
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(
                width: 20.w,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.green,
                  )),
              Spacer()
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Obx(() => controller.status.value == RequestStatus.loading
              ? CustomLoader()
              : CustomButton(
                  onTap: () {
                    controller.createOrder();
                  },
                  height: 60.h,
                  width: 250.w,
                  text: "Order Now",
                  isFill: true,
                )),
        ],
      ),
    );
  }
}
