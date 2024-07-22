// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clinic/data/models/user_model.dart';

class AdminModel extends UserModel {
  final String phone;
  final String address;
  AdminModel({
    required this.phone,
    required this.address, required super.name, required super.email, required super.type,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'address': address,
    };
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      phone: map['phone'] as String,
      address: map['address'] as String, name: '', email: '', type: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminModel.fromJson(String source) => AdminModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AdminModel(phone: $phone, address: $address)';

  @override
  bool operator ==(covariant AdminModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.phone == phone &&
      other.address == address;
  }

  @override
  int get hashCode => phone.hashCode ^ address.hashCode;
}
