import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/common/widgets/no_data.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/admin/controllers/admin_page_controller.dart';
import 'package:clinic/features_admin/admin/widgets/admin_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminsPage extends GetView<AdminPageController> {
  const AdminsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminPageController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.createAdminPage);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        switch (controller.adminsRequestStatus.value) {
          case RequestStatus.loading:
            return const Center(child: CustomLoader());
          case RequestStatus.onerror:
            return const NoData(
              text: 'Error occured',
            );
          case RequestStatus.nodata:
            return const NoData(
              text: 'No Admins Available',
            );
          case RequestStatus.success:
            return GetBuilder<AdminPageController>(builder: (_) {
              return RefreshIndicator(
                onRefresh: () {
                  return controller.getAdmins();
                },
                child: ListView.builder(
                    itemCount: controller.admins.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return AdminWidget(
                        model: controller.admins[i],
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
