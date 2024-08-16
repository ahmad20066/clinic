import 'package:clinic/data/models/medic_model.dart';
import 'package:clinic/features/home/widgets/medics/medic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicsList extends StatelessWidget {
  final List<MedicModel> medics;
  const MedicsList({super.key, required this.medics});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: medics.length,
                itemBuilder: (context, index) {
                  return MedicWidget(medicine: medics[index]);
                }),
          ],
        ),
      ),
    );
  }
}
