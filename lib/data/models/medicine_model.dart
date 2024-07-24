class MedicineModel {
  int? id;
  int? clinicId;
  String? name;
  String? description;
  String? targetGroup;
  String? date;
  int? price;

  MedicineModel(
      {this.name,
      this.targetGroup,
      this.description,
      this.date,
      this.clinicId,
      this.id,
      this.price});

  MedicineModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    targetGroup = map['target_group'];
    clinicId = (map['clinic_id'] is int)
        ? map['clinic_id']
        : int.parse(map['clinic_id']);
    date = map['date'];
    price = (map['price'] is int)
        ? map['price']
        : int.parse(map['price']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'target_group': targetGroup,
      'date': date,
      'clinic_id': clinicId,
      'admin_id': 1,
      'price': price
    };
  }
}
