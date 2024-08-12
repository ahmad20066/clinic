import 'package:clinic/common/constants/app_colors.dart';
import 'package:clinic/data/enums/request_status.dart';
import 'package:clinic/features/auth/widgets/title_widget.dart';
import 'package:clinic/features_doctor/appointments/controllers/appointments_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppointmentsPAge extends StatelessWidget {
  const AppointmentsPAge({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppointmentsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: AppColors.primaryColor,
              height: MediaQuery.of(context).size.height / 4,
            ),
            Column(
              children: [
                SizedBox(
                  height: 140.h,
                ),
                Align(
                  alignment: Alignment(-1, 1),
                  child: TitleWidget(
                    text: 'Appointments',
                    size: 35.sp,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Obx(() => controller.status.value == RequestStatus.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.appointments.length,
                        itemBuilder: (context, index) {
                          final appointment = controller.appointments[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today,
                                          color: Colors.teal),
                                      SizedBox(width: 10),
                                      Text(
                                        'Appointment ID: ${appointment.id}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.teal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.date_range,
                                          color: Colors.grey),
                                      SizedBox(width: 10),
                                      Text(
                                        'Date: ${appointment.date}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          color: Colors.grey),
                                      SizedBox(width: 10),
                                      Text(
                                        'Time: ${appointment.time_booked}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Divider(),
                                  SizedBox(height: 16),
                                  Text(
                                    'Patient Information',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.teal,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.person, color: Colors.grey),
                                      SizedBox(width: 10),
                                      Text(
                                        'Name: ${appointment.patient.name}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.cake, color: Colors.grey),
                                      SizedBox(width: 10),
                                      Text(
                                        'Age: ${appointment.patient.age}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.wc, color: Colors.grey),
                                      SizedBox(width: 10),
                                      Text(
                                        'Gender: ${appointment.patient.gender}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.attach_money,
                                          color: Colors.grey),
                                      SizedBox(width: 10),
                                      Text(
                                        'Budget: ${appointment.patient.budget}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
