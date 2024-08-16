class EmployeeReviewModel {
  int? id;
  int? clinicId;
  int? employeeId;
  String? name;
  String? age;
  String? gender;
  int? sallary;
  String? openingDate;
  String? contractDate;

  EmployeeReviewModel(
      {this.id,
      this.clinicId,
      this.employeeId,
      this.name,
      this.age,
      this.gender,
      this.sallary,
      this.openingDate,
      this.contractDate});

  EmployeeReviewModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    clinicId = map['clinic_id'];
    employeeId = map['employe_id'];
    name = map['name'];
    age = map['age'];
    gender = map['gender'];
    sallary = map['sallary'];
    openingDate = map['opening_date'];
    contractDate = map['date_contract'];
  }
}
