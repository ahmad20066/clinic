import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/common/widgets/no_data.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/medicine/controllers/medicines_page_controller.dart';
import 'package:clinic/features_admin/medicine/widgets/Medicine_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicinesPage extends GetView<MedicinesPageController> {
  const MedicinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MedicinesPageController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.createMedicinePage);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        switch (controller.medicinesRequestStatus.value) {
          case RequestStatus.loading:
            return const Center(child: CustomLoader());
          case RequestStatus.onerror:
            return const NoData(
              text: 'Error occured',
            );
          case RequestStatus.nodata:
            return const NoData(
              text: 'No Medicines Available',
            );
          case RequestStatus.success:
            return GetBuilder<MedicinesPageController>(builder: (_) {
              return RefreshIndicator(
                onRefresh: () {
                  return controller.getMedicines();
                },
                child: ListView.builder(
                    itemCount: controller.medicines.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return MedicineWidget(
                        model: controller.medicines[i],
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
