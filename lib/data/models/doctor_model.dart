// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clinic/data/models/section_model.dart';
import 'package:clinic/data/models/user_model.dart';

class DoctorModel {
  final String phone_number;
  final String address;
  final String age;
  final String working_hour;
  final int section_id;
  final String name;
  final int id;
  SectionModel? section;
  DoctorModel({
    required this.phone_number,
    required this.address,
    required this.age,
    required this.working_hour,
    required this.section_id,
    required this.name,
    required this.id,
    this.section,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone_number': phone_number,
      'address': address,
      'age': age,
      'working_hour': working_hour,
      'section_id': section_id,
      'name': name,
      'section': section?.toMap(),
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      phone_number: map['phone_number'].toString() as String,
      address: map['address'] as String,
      age: map['age'].toString() as String,
      working_hour: map['working_hour'] as String,
      section_id: map['section_id'] as int,
      name: map['name'] as String,
      section: map['section'] != null
          ? SectionModel.fromMap(map['section'] as Map<String, dynamic>)
          : null,
      id: map['id'],
    );
  }
}
