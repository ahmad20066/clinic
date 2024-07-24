class ContractModel {
  int? id;
  int? employeeId;
  String? contractDate;
  String? openingDate;
  int? salary;

  ContractModel({
    this.id,
    this.employeeId,
    this.contractDate,
    this.openingDate,
    this.salary
  });

  ContractModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    employeeId = map['employee_id'];
    contractDate = map['date_contract'];
    openingDate = map['opening_date'];
    salary = map['sallary'];
  }

  Map<String, dynamic> toJson() {
    return {
      'employee_id': employeeId,
      'date_contract': contractDate,
      'opening_date': openingDate,
      'sallary': salary
    };
  }
}
