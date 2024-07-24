import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/common/widgets/no_data.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/vaccine/controllers/vaccines_page_controller.dart';
import 'package:clinic/features_admin/vaccine/widgets/vaccine_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaccinesPage extends GetView<VaccinesPageController> {
  const VaccinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VaccinesPageController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.createVaccinePage);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        switch (controller.vaccinesRequestStatus.value) {
          case RequestStatus.loading:
            return const Center(child: CustomLoader());
          case RequestStatus.onerror:
            return const NoData(
              text: 'Error occured',
            );
          case RequestStatus.nodata:
            return const NoData(text: 'No Vaccines Available',);
          case RequestStatus.success:
            return GetBuilder<VaccinesPageController>(builder: (_) {
              return RefreshIndicator(
                onRefresh: () {
                  return controller.getVaccines();
                },
                child: ListView.builder(
                    itemCount: controller.vaccines.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return VaccineWidget(
                        model: controller.vaccines[i],
                      );
                    }),
              );
            });
          default:
            return Container();
        }
      }),
    );
  }
}
