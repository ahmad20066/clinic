class ClinicModel {
  int? id;
  int? adminId;
  String? name;
  String? description;

  ClinicModel({
    this.id,
    this.adminId,
    this.name,
    this.description,
  });

  ClinicModel.fromJson(Map<String?, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'admin_id': 1
    };
  }
}
