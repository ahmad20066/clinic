class EmployeeModel {
  int? id;
  int? clinicId;
  String? name;
  String? age;
  String? gender;

  EmployeeModel({this.id, this.clinicId, this.name, this.age, this.gender});

  EmployeeModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    clinicId = map['clinic_id'];
    name = map['name'];
    age = map['age'];
    gender = map['gender'];
  }
}
