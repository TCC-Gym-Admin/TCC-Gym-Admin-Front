import 'package:equatable/equatable.dart';

class EmployeesModel extends Equatable {
  final String? fullname;
  final String? id;
  final int? age;
  final String? role;
  final String? document;
  final String? address;
  final double? salary;
  const EmployeesModel({
    this.fullname,
    this.age,
    this.role,
    this.document,
    this.address,
    this.salary,
    this.id,
  });

  EmployeesModel copyWith({
    String? fullname,
    int? age,
    String? role,
    String? document,
    String? address,
    String? id,
    double? salary,
  }) {
    return EmployeesModel(
      fullname: fullname ?? this.fullname,
      id: id ?? this.id,
      age: age ?? this.age,
      role: role ?? this.role,
      document: document ?? this.document,
      address: address ?? this.address,
      salary: salary ?? this.salary,
    );
  }

  @override
  List<Object?> get props => [
    fullname,
    age,
    role,
    document,
    address,
    salary,
    id,
  ];

  factory EmployeesModel.fromJson(Map<String, dynamic> map) {
    return EmployeesModel(
      fullname: map['fullName'],
      age: map['age'],
      role: map['position'],
      document: map['identificationNumber'],
      address: map['address'],
      salary: map['salary'],
      id: map['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullname,
      "age": age,
      "position": "PERSONAL_TRAINER",
      "identificationNumber": document,
      "salary": salary,
      "address": address,
    };
  }
}
