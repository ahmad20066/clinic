class AdminModel {
  int? id;
  int? adminId;
  String? name;
  String? address;
  String? phone;

  AdminModel({this.name, this.address, this.phone, this.id});

  AdminModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    address = map['address'];
    phone = map['phone'];
    id = map['id'];
    adminId = map['admin_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
