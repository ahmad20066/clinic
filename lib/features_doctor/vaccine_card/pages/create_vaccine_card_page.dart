import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/data/models/patient_model.dart';
import 'package:clinic/data/models/vaccine_model.dart';
import 'package:clinic/features/auth/widgets/title_widget.dart';
import 'package:clinic/features_doctor/vaccine_card/controllers/vaccine_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For formatting the date

class CreateVaccineCardPage extends StatelessWidget {
  final VaccineCardController controller = Get.put(VaccineCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.primaryColor,
            height: MediaQuery.of(context).size.height / 4,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              if (controller.vaccineStatus.value == RequestStatus.loading ||
                  controller.patientStatus.value == RequestStatus.loading) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.vaccineStatus.value == RequestStatus.onerror ||
                  controller.patientStatus.value == RequestStatus.onerror) {
                return Center(child: Text('Error loading data'));
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    TitleWidget(text: 'Create Vaccine Card'),
                    SizedBox(
                      height: 80.h,
                    ),
                    // Vaccine Dropdown
                    DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        labelText: 'Select Vaccine',
                        border: OutlineInputBorder(),
                      ),
                      value: controller.selectedVaccineId.value,
                      onChanged: (int? newValue) {
                        controller.selectedVaccineId.value = newValue;
                      },
                      items: controller.vaccines
                          .map<DropdownMenuItem<int>>((VaccineModel vaccine) {
                        return DropdownMenuItem<int>(
                          value: vaccine.id,
                          child: Text(vaccine.name!),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),

                    // Patient Dropdown
                    DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        labelText: 'Select Patient',
                        border: OutlineInputBorder(),
                      ),
                      value: controller.selectedPatientId.value,
                      onChanged: (int? newValue) {
                        controller.selectedPatientId.value = newValue;
                      },
                      items: controller.patients
                          .map<DropdownMenuItem<int>>((PatientModel patient) {
                        return DropdownMenuItem<int>(
                          value: patient.id,
                          child: Text(patient.name),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),

                    // Date Picker
                    Obx(() => TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Select Date',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(pickedDate.toString());
                              controller.selectedDate.value = formattedDate;
                            }
                          },
                          controller: TextEditingController(
                            text: controller.selectedDate.value ?? '',
                          ),
                        )),
                    SizedBox(height: 16),

                    // Description Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 4,
                      onChanged: (value) {
                        controller.description.value = value;
                      },
                    ),
                    SizedBox(height: 32),

                    // Submit Button
                    Obx(() => controller.status.value == RequestStatus.loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (controller.selectedVaccineId.value != null &&
                                    controller.selectedPatientId.value !=
                                        null &&
                                    controller.selectedDate.value != null &&
                                    controller.description.value!.isNotEmpty) {
                                  controller.createVaccineCard();
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    'Please fill out all fields',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              child: Text('Create Vaccine Card'),
                              style: ElevatedButton.styleFrom(
                                // primary: Colors.teal,
                                backgroundColor: AppColors.primaryColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                textStyle: TextStyle(fontSize: 16),
                              ),
                            ),
                          )),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
