import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppointmentModel {
  final int id;
  final String date;
  final String time_booked;
  final PatientAppointment patient;
  AppointmentModel({
    required this.id,
    required this.date,
    required this.time_booked,
    required this.patient,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'time_booked': time_booked,
      'patient': patient.toMap(),
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'] as int,
      date: map['date'] as String,
      time_booked: map['time_booked'].toString() as String,
      patient:
          PatientAppointment.fromMap(map['patient'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentModel.fromJson(String source) =>
      AppointmentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PatientAppointment {
  final String age;
  final String name;
  final String gender;
  final String date;
  final String budget;
  PatientAppointment({
    required this.age,
    required this.name,
    required this.gender,
    required this.date,
    required this.budget,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'age': age,
      'name': name,
      'gender': gender,
      'date': date,
      'budget': budget,
    };
  }

  factory PatientAppointment.fromMap(Map<String, dynamic> map) {
    return PatientAppointment(
      age: map['age'].toString() as String,
      name: map['first_name'] as String,
      gender: map['gender'] as String,
      date: map['date'] as String,
      budget: map['budget'].toString() as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientAppointment.fromJson(String source) =>
      PatientAppointment.fromMap(json.decode(source) as Map<String, dynamic>);
}
