// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clinic/data/models/user_model.dart';

class DoctorModel extends UserModel {
  final String phone_number;
  final String address;
  final String age;
  final int section_id;
  DoctorModel({
    required this.phone_number,
    required this.address,
    required this.age,
    required this.section_id,
    required super.name,
    required super.email,
    super.password,
    required super.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone_number': phone_number,
      'address': address,
      'age': age,
      'section_id': section_id,
      'password': password,
      "name": name,
      "email": email,
      
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      phone_number: map['phone_number'] as String,
      address: map['address'] as String,
      age: map['age'] as String,
      section_id: map['section_id'] as int,
      name: map['name'],
      email: map['email'],
      type: "",
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromJson(String source) =>
      DoctorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
