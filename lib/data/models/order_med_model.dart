import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderMedModel {
  final int order_id;
  final int medical_id;
  final int amount;
  OrderMedModel({
    required this.order_id,
    required this.medical_id,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'order_id': order_id,
      'medical_id': medical_id,
      'amount': amount,
    };
  }

  factory OrderMedModel.fromMap(Map<String, dynamic> map) {
    return OrderMedModel(
      order_id: map['order_id'] as int,
      medical_id: map['medical_id'] as int,
      amount: map['amount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderMedModel.fromJson(String source) =>
      OrderMedModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
