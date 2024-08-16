class InvoiceModel {
  int? id;
  int? orderMedId;
  int? price;
  String? date;

  InvoiceModel({
    this.id,
    this.orderMedId,
    this.price,
    this.date,
  });

  InvoiceModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    orderMedId = map['order_med_id'];
    price = map['price_all'];
    date = map['date'];
  }
}
