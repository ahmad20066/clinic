import 'dart:io';

import 'package:clinic/data/models/section_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorFormController extends GetxController{
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Rx<File?> image = Rx(null);
  List<SectionModel> sections = [];
  RxInt selectedSection = 0.obs;
}