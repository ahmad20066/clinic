import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/common/widgets/no_data.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/clinic/controllers/clinic_controller.dart';
import 'package:clinic/features_admin/clinic/controllers/edit_clinic_controller.dart';
import 'package:clinic/features_admin/clinic/widgets/clinic_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClinicPage extends GetView<ClinicController> {
  const ClinicPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ClinicController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addClinicPage);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        switch (controller.clinicsRequestStatus.value) {
          case RequestStatus.loading:
            return const Center(child: CustomLoader());
          case RequestStatus.onerror:
            return const NoData(
              text: 'Error occured',
            );
          case RequestStatus.nodata:
            return const NoData(text: 'No Clinics Available');
          case RequestStatus.success:
            return GetBuilder<ClinicController>(builder: (_) {
              return RefreshIndicator(
                onRefresh: () {
                  return controller.getClinics();
                },
                child: ListView.builder(
                    itemCount: controller.clinics.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return ClinicWidget(
                        model: controller.clinics[i],
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
