import 'dart:convert';

import 'package:equatable/equatable.dart';

class EmployeesModel extends Equatable {
  final String? fullname;
  final int? age;
  final String? role;
  final String? document;
  final String? address;
  final String? salary;
  EmployeesModel({
    this.fullname,
    this.age,
    this.role,
    this.document,
    this.address,
    this.salary,
  });

  EmployeesModel copyWith({
    String? fullname,
    int? age,
    String? role,
    String? document,
    String? address,
    String? salary,
  }) {
    return EmployeesModel(
      fullname: fullname ?? this.fullname,
      age: age ?? this.age,
      role: role ?? this.role,
      document: document ?? this.document,
      address: address ?? this.address,
      salary: salary ?? this.salary,
    );
  }

  @override
  List<Object?> get props => [fullname, age, role, document, address, salary];

  factory EmployeesModel.fromJson(Map<String, dynamic> map) {
    return EmployeesModel(
      fullname: map['nomeCompleto'],
      age: map['idade'],
      role: map['cargo'],
      document: map['cpf'],
      address: map['endereco'],
      salary: map['salario'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nomeCompleto": fullname,
      "idade": age,
      "cargo": role,
      "cpf": document,
      "salario": salary,
      "endereco": address,
    };
  }
}
