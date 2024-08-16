import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String name;
  final String email;
  final String? password;
  final String type;
  UserModel({
    required this.name,
    required this.email,
    this.password,
    required this.type,
  });

  Map<String, dynamic> toMapRegister() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'type': type,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
     
      type: map['type'] as String,
    );
  }

  
}
