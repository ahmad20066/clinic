class Order {
  String? firstName;

  Order({required this.firstName});

  Order.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
  }
}

class Booked {
  String? firstName;

  Booked({required this.firstName});

  Booked.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
  }
}

class ReviewModel {
  List<Order>? orderedNames;
  List<Booked>? bookedNames;
  int? numberOfOrders;
  int? numberOfBooked;

  ReviewModel({
    required this.orderedNames,
    required this.bookedNames,
    required this.numberOfOrders,
    required this.numberOfBooked,
  });

  ReviewModel.fromJson(Map<String, dynamic> map) {
    orderedNames =
        (map['order'] as List).map((item) => Order.fromJson(item)).toList();
    bookedNames =
        (map['booked'] as List).map((item) => Booked.fromJson(item)).toList();
    numberOfOrders = map['num user have order'];
    numberOfBooked = map['num user have booked'];
  }
}
