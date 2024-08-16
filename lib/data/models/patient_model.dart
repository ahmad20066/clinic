import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PatientModel {
  final String age;
  final String name;
  final String gender;
  final String date;
  final String budget;
  final int id;
  PatientModel({
    required this.id,
    required this.age,
    required this.budget,
    required this.name,
    required this.gender,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'age': age,
      'budget': budget,
      'first_name': name,
      'secound_name': " aa",
      'gender': gender,
      'date': date,
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      age: map['age'].toString() as String,
      id: map['id'],
      budget: map['budget'].toString() as String,
      name: map['first_name'] as String,
      gender: map['gender'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientModel.fromJson(String source) =>
      PatientModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
