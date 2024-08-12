import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class VaccineCard {
  final int vaccine_id;
  final int patient_id;
  final String date;
  final String description;
  VaccineCard({
    required this.vaccine_id,
    required this.patient_id,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vaccine_id': vaccine_id,
      'patient_id': patient_id,
      'date': date,
      'description': description,
    };
  }

  factory VaccineCard.fromMap(Map<String, dynamic> map) {
    return VaccineCard(
      vaccine_id: map['vaccine_id'] as int,
      patient_id: map['patient_id'] as int,
      date: map['date'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VaccineCard.fromJson(String source) =>
      VaccineCard.fromMap(json.decode(source) as Map<String, dynamic>);
}
