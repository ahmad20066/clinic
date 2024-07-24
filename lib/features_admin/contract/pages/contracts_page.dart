import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/common/widgets/no_data.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/contract/controllers/contacts_page_controller.dart';
import 'package:clinic/features_admin/contract/widgets/contract_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContractsPage extends GetView<ContractsPageController> {
  const ContractsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContractsPageController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.createContractPage);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        switch (controller.contractsRequestStatus.value) {
          case RequestStatus.loading:
            return const Center(child: CustomLoader());
          case RequestStatus.onerror:
            return const NoData(
              text: 'Error occured',
            );
          case RequestStatus.nodata:
            return const NoData(
              text: 'No Contracts Available',
            );
          case RequestStatus.success:
            return GetBuilder<ContractsPageController>(builder: (_) {
              return RefreshIndicator(
                onRefresh: () {
                  return controller.getcontracts();
                },
                child: ListView.builder(
                    itemCount: controller.contracts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return ContractWidget(
                        model: controller.contracts[i],
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
