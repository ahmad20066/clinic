import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_employee/reviews/controllers/reviews_controller.dart';
import 'package:clinic/features_employee/reviews/widgets/count_container.dart';
import 'package:clinic/features_employee/reviews/widgets/reviews_bottom_sheet.dart';
import 'package:clinic/features_employee/reviews/widgets/title_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReviewsPage extends GetView<ReviewsController> {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReviewsController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(ReviewsBottomSheet());
        },
        child: Icon(Icons.search),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: REdgeInsets.all(10),
        child: GetBuilder<ReviewsController>(builder: (context) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CountContainer(
                      text: 'Number of users that have an order:',
                      count: controller.ordersCount.value),
                  SizedBox(
                    width: 10.w,
                  ),
                  CountContainer(
                      text: 'Number of users that have booked:',
                      count: controller.bookingCount.value),
                ],
              ),
              Obx(() {
                switch (controller.reviewsRequestStatus.value) {
                  case RequestStatus.loading:
                    return const CustomLoader();
                  case RequestStatus.success:
                    return Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30.h),
                              if (controller.reviews!.orderedNames!.isNotEmpty)
                                TitleContainer(
                                  text: 'Orders',
                                ),
                              if (controller.reviews!.orderedNames!.isNotEmpty)
                                Padding(
                                  padding: REdgeInsets.only(left: 20, top: 20),
                                  child: ListView.builder(
                                      itemCount: controller
                                          .reviews!.orderedNames!.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: REdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: Text(
                                            controller.reviews!.orderedNames![i]
                                                .firstName!,
                                          ),
                                        );
                                      }),
                                ),
                              SizedBox(height: 20.h),
                              if (controller.reviews!.bookedNames!.isNotEmpty)
                                TitleContainer(
                                  text: 'Bookings',
                                ),
                              if (controller.reviews!.bookedNames!.isNotEmpty)
                                Padding(
                                  padding: REdgeInsets.only(left: 20, top: 20),
                                  child: ListView.builder(
                                      itemCount: controller
                                          .reviews!.orderedNames!.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: REdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: Text(
                                            controller.reviews!.bookedNames![i]
                                                .firstName!,
                                          ),
                                        );
                                      }),
                                )
                            ],
                          ),
                        )
                      ],
                    );
                  default:
                    return Container();
                }
              }),
            ],
          );
        }),
      ),
    );
  }
}
