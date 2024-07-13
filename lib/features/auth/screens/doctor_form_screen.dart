import 'package:animated_background/animated_background.dart';
import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/common/widgets/custom_button.dart';
import 'package:clinic/common/widgets/custom_textfield.dart';
import 'package:clinic/features/auth/controllers/doctor_form_controller.dart';
import 'package:clinic/features/auth/widgets/background_image.dart';
import 'package:clinic/features/auth/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DoctorFormScreen extends StatelessWidget {
  const DoctorFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorFormController());
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
                height: 20,
              ),
              CircleAvatar(
                radius: 55.r,
                backgroundColor: Colors.white,
                backgroundImage: controller.image.value == null
                    ? const AssetImage('assets/images/an.png')
                    : FileImage(controller.image.value!) as ImageProvider,
              ),
              TextButton.icon(
                  onPressed: () async {
                    final file = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (file == null) {
                      return;
                    }
                    
                  },
                  icon: Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Pick a profile image',
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  preIcon: Icons.numbers,
                  textController: controller.phoneController,
                  labelText: 'Phone Number',
                  pMargin: 10,
                  hmargin: 30),
              CustomTextField(
                  preIcon: Icons.location_on_outlined,
                  textController: controller.addressController,
                  labelText: 'Address',
                  pMargin: 10,
                  hmargin: 30),
              CustomTextField(
                  preIcon: Icons.work_outline,
                  textController: controller.ageController,
                  labelText: 'Age',
                  pMargin: 10,
                  hmargin: 30),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 180.w,
                padding: REdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<int>(
                          
                          borderRadius: BorderRadius.circular(15),
                          iconEnabledColor:AppColors.primaryColor,
                          dropdownColor: Colors.white,
                          value: controller.selectedSection.value == 0 ? null : controller.selectedSection.value,
                          hint: Text("Section"),
                          items: controller.sections
                              .map(
                                (e) => DropdownMenuItem<int>(
                                    value: e.id,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(e.name),
                                    )),
                              )
                              .toList(),
                          onChanged: (value) {
                            controller.selectedSection(value);
                          }),
                    ),
              SizedBox(
                height: 60,
              ),
              CustomButton(
                  onTap: () async {
                    
                  },
                  height: 60.h,
                  width: 270.w,
                  text: 'Sign Up'),
            ],
          ),
        )
      ]),
    );
  }
}