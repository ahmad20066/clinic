import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MedicModel {
  final int id;
  final String name;
  final String target_group;
  final String date;
  final String description;
  final String price;
  MedicModel({
    required this.id,
    required this.name,
    required this.target_group,
    required this.date,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'target_group': target_group,
      'date': date,
      'description': description,
      'price': price,
    };
  }

  factory MedicModel.fromMap(Map<String, dynamic> map) {
    return MedicModel(
      id: map['id'] as int,
      name: map['name'] as String,
      target_group: map['target_group'] as String,
      date: map['date'] as String,
      description: map['description'] as String,
      price: map['price'].toString() as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicModel.fromJson(String source) =>
      MedicModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
