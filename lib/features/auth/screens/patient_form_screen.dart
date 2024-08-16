import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/utils/custom_toasts.dart';
import 'package:clinic/common/widgets/custom_button.dart';
import 'package:clinic/common/widgets/custom_textfield.dart';
import 'package:clinic/common/widgets/loader.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features/auth/controllers/patient_form_controller.dart';
import 'package:clinic/features/auth/widgets/background_image.dart';
import 'package:clinic/features/auth/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../common/utils/utils.dart';

class PatientFormScreen extends StatelessWidget {
  const PatientFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientFormController());
    return Scaffold(
      body: Stack(children: [
        BackGroundImage(),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80.h,
              ),
              TitleWidget(text: 'TELL US MORE ABOUT YOURSELF'),
              SizedBox(
                height: 40.h,
              ),
              CustomTextField(
                  preIcon: Icons.work_outline,
                  textController: controller.ageController,
                  labelText: 'Age',
                  pMargin: 10,
                  type: TextInputType.number,
                  hmargin: 30),
              CustomTextField(
                  preIcon: Icons.monetization_on_outlined,
                  textController: controller.budgetController,
                  labelText: 'Budget',
                  pMargin: 10,
                  type: TextInputType.number,
                  hmargin: 30),
              CustomTextField(
                  preIcon: Icons.calendar_month,
                  textController: controller.dateController!,
                  readOnly: true,
                  onTap: () async {
                    controller.date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now());
                    controller.dateController!.text = Utils.dateFormat(
                        controller.date!,
                        expression: 'yyyy-MM-dd');
                  },
                  labelText: "Birth Date",
                  pMargin: 10,
                  hmargin: 30),
              GetBuilder<PatientFormController>(builder: (_) {
                return Padding(
                  padding: REdgeInsets.all(30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          " Gender",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          // textAlign: TextAlign.left,
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.white,
                              disabledColor: Colors.blue),
                          child: RadioListTile<String>(
                              tileColor: Colors.white,
                              activeColor: Colors.white,
                              title: const Text(
                                "Male",
                                style: TextStyle(color: Colors.white),
                              ),
                              value: "male",
                              groupValue: controller.gender,
                              onChanged: (val) {
                                controller.changeGender(val!);
                              }),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.white,
                              disabledColor: Colors.blue),
                          child: RadioListTile(
                            activeColor: Colors.white,
                            title: const Text(
                              "Female",
                              style: TextStyle(color: Colors.white),
                            ),
                            value: "female",
                            groupValue: controller.gender,
                            onChanged: (val) {
                              controller.changeGender(val!);
                            },
                          ),
                        )
                      ]),
                );
              }),
              SizedBox(
                height: 60,
              ),
              Obx(() => controller.status.value == RequestStatus.loading
                  ? CustomLoader(
                      color: Colors.white,
                    )
                  : CustomButton(
                      onTap: () async {
                        if (controller.date == null) {
                          CustomToasts.ErrorDialog(
                              "Please Enter your birth date");
                        } else if (controller.ageController.text.isEmpty) {
                          CustomToasts.ErrorDialog("Please Enter your age");
                        } else if (controller.gender == null) {
                          CustomToasts.ErrorDialog("Please Enter your gender");
                        } else if (controller.budgetController.text.isEmpty) {
                          CustomToasts.ErrorDialog("Please Enter your budget");
                        } else {
                          controller.createPatient();
                        }
                      },
                      height: 60.h,
                      width: 270.w,
                      text: 'Sign Up')),
            ],
          ),
        )
      ]),
    );
  }
}
