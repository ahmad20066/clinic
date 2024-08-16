import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderModel {
  final String date;
  final int patient_id;
  final int clinic_id;

  OrderModel({
    required this.date,
    required this.patient_id,
    required this.clinic_id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'patient_id': patient_id,
      'clinic_id': clinic_id,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      date: map['date'] as String,
      patient_id: map['patient_id'] as int,
      clinic_id: map['clinic_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
