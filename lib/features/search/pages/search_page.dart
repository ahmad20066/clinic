import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features/auth/widgets/title_widget.dart';
import 'package:clinic/features/search/controllers/search_controller.dart';
import 'package:clinic/features/search/widgets/doctors_grid.dart';
import 'package:clinic/features/search/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchDoctorsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: AppColors.primaryColor,
              height: MediaQuery.of(context).size.height / 4,
            ),
            Column(
              children: [
                SizedBox(
                  height: 70.h,
                ),
                Align(
                  alignment: Alignment(-1, 1),
                  child: TitleWidget(
                    text: 'Find Your Doctor',
                    size: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomSearchBar(onChanged: (v) {
                  controller.searchDcotors(v);
                }),
                SizedBox(height: 40.h),
                Obx(() => controller.doctorsStatus.value ==
                        RequestStatus.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Obx(() =>
                        DoctorsGrid(docotrs: controller.searchDoctors.value))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
