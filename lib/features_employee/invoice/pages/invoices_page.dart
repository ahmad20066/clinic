import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/common/widgets/no_data.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_employee/invoice/controllers/invoices_controller.dart';
import 'package:clinic/features_employee/invoice/widgets/invoice_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoicesPage extends GetView<InvoicesController> {
  const InvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InvoicesController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          switch (controller.invoicesRequestStatus.value) {
            case RequestStatus.loading:
              return const Center(child: Center(child: CustomLoader()));
            case RequestStatus.onerror:
              return const NoData(
                text: 'Error occured',
              );
            case RequestStatus.nodata:
              return const NoData(
                text: 'No Invoices Available',
              );
            case RequestStatus.success:
              return ListView.builder(
                  itemCount: controller.invoices.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return InvoiceWidget(
                      model: controller.invoices[i],
                    );
                  });

            default:
              return Container();
          }
        }),
      ),
    );
  }
}
