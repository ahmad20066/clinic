import 'package:clinic/data/models/doctor_model.dart';
import 'package:clinic/features/home/widgets/docotrs/doctor_widget.dart';
import 'package:flutter/material.dart';

class DoctorsGrid extends StatelessWidget {
  final List<DoctorModel> docotrs;
  const DoctorsGrid({super.key, required this.docotrs});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: docotrs.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return DoctorWidget(doctor: docotrs[index]);
        });
  }
}
