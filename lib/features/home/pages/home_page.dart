import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/widgets/custom_appbar2.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/common/widgets/no_data.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features/auth/widgets/title_widget.dart';
import 'package:clinic/features/home/controllers/home_controller.dart';
import 'package:clinic/features/home/widgets/docotrs/doctors_list.dart';
import 'package:clinic/features/home/widgets/medics/medics_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            color: AppColors.primaryColor,
            height: MediaQuery.of(context).size.height / 2,
          ),
          Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              // CustomAppBar(),
              // SizedBox(
              //   height: 20.h,
              // ),
              TitleWidget(
                text: 'EXPLORE AND BOOK YOUR NEXT APPOINTMENT',
                size: 25.sp,
              ),
              SizedBox(
                height: 60.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Divider(
                      // endIndent: 100.w,
                      color: Colors.white,
                      thickness: 3,
                      height: 10.h,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Medics',
                    style: TextStyle(color: Colors.white, fontSize: 28.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(() {
                switch (controller.medicsStatus.value) {
                  case RequestStatus.loading:
                    return SizedBox(
                      height: 100.h,
                      child: CustomLoader(
                        color: Colors.white,
                      ),
                    );
                  case RequestStatus.success:
                    return MedicsList(medics: controller.medics);
                  case RequestStatus.nodata:
                    return NoData();
                  default:
                    return SizedBox.shrink();
                }
              }),
              SizedBox(
                height: 50.h,
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
                    'Doctors',
                    style: TextStyle(
                        color: AppColors.primaryColor, fontSize: 28.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(() {
                switch (controller.doctorsStatus.value) {
                  case RequestStatus.loading:
                    return CustomLoader(
                      color: Colors.white,
                    );
                  case RequestStatus.success:
                    return DoctorsList(doctors: controller.doctors);
                  case RequestStatus.nodata:
                    return NoData();
                  default:
                    return SizedBox.shrink();
                }
              }),
            ],
          )
        ]),
      ),
    );
  }
}
