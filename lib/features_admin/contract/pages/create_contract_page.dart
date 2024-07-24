import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/widgets/custom_appbar.dart';
import 'package:clinic/common/widgets/custom_button_two.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features_admin/contract/widgets/contract_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateContractPage extends StatelessWidget {
  const CreateContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
    // return SafeArea(
    //     child: Scaffold(
    //   appBar: const CustomAppBar(
    //     title: 'Create a contract',
    //     hasLeading: true,
    //   ),
    //   bottomNavigationBar: Padding(
    //     padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
    //     child: Obx(
    //       () => controller.createVaccineRequestStatus.value ==
    //               RequestStatus.loading
    //           ? CustomLoader()
    //           : CustomButtonTwo(
    //               title: 'Add',
    //               icon: 'assets/svg/icons/add.svg',
    //               isprefix: true,
    //               onTap: () {
    //                 if (controller.dateController.selectedDate == null) {
    //                   CustomToasts.ErrorDialog('Please select a date');
    //                 }
    //                 if (controller.formKey.currentState!.validate() &&
    //                     controller.dateController.selectedDate != null) {
    //                   controller.createVaccine();
    //                 }
    //               },
    //             ),
    //     ),
    //   ),
    //   body: Form(
    //     key: controller.formKey,
    //     child: GestureDetector(
    //       onTap: () {
    //         FocusScope.of(context).requestFocus(FocusNode());
    //       },
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             ContractFeildWidget(
    //               title: 'Clinic ID',
    //               textFeild: CustomTextFieldTwo(
    //                 controller: controller.clinicIdController,
    //                 hintText: 'Enter Clinic ID',
    //                 keyboardType: TextInputType.number,
    //                 validator: (val) {
    //                   if (val!.isEmpty) {
    //                     return 'Feild required';
    //                   }
    //                   return null;
    //                 },
    //               ),
    //             ),
    //             ContractFeildWidget(
    //               title: 'Name',
    //               textFeild: CustomTextFieldTwo(
    //                 controller: controller.nameController,
    //                 hintText: 'Enter name',
    //                 validator: (val) {
    //                   if (val!.isEmpty) {
    //                     return 'Feild required';
    //                   }
    //                   // return null;
    //                 },
    //               ),
    //             ),
    //             ContractFeildWidget(
    //               title: 'Description',
    //               textFeild: CustomTextFieldTwo(
    //                 controller: controller.descriptionController,
    //                 hintText: 'Enter Description',
    //                 validator: (val) {
    //                   if (val!.isEmpty) {
    //                     return 'Feild required';
    //                   }
    //                   return null;
    //                 },
    //               ),
    //             ),
    //             ContractFeildWidget(
    //               title: 'Target Group',
    //               textFeild: CustomTextFieldTwo(
    //                 controller: controller.targetGroupController,
    //                 hintText: 'Enter Target Group',
    //                 validator: (val) {
    //                   if (val!.isEmpty) {
    //                     return 'Feild required';
    //                   }
    //                   return null;
    //                 },
    //               ),
    //             ),
    //             SizedBox(height: 15.h),
    //             Padding(
    //               padding: REdgeInsets.symmetric(horizontal: 15),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text('Date'),
    //                   SizedBox(height: 10.h),
    //                   SfDateRangePicker(
    //                     controller: controller.dateController,
    //                     selectionColor: AppColors.primaryColor,
    //                     todayHighlightColor: AppColors.primaryColor,
    //                     monthCellStyle: const DateRangePickerMonthCellStyle(
    //                       todayTextStyle: TextStyle(
    //                         color: AppColors
    //                             .primaryColor, // Set the color for today's date text
    //                       ),
    //                     ),
    //                     onSelectionChanged: (va) {
    //                       // print(controller.dateController.selectedDate);
    //                       String date = Utils.dateFormat(
    //                           controller.dateController.selectedDate!,
    //                           expression: 'yyyy-MM-dd');
    //                       print(date);
    //                       // Utils.dateFormat(va.value);
    //                     },
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // ));
  }
}
