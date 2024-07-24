import 'package:clinic/data/models/doctor_model.dart';
import 'package:clinic/features/home/widgets/docotrs/doctor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsList extends StatelessWidget {
  final List<DoctorModel> doctors;
  const DoctorsList({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return DoctorWidget(
                    text: doctors[index].name,
                    section: doctors[index].section!.name,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
