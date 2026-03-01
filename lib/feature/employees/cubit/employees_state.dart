import 'package:equatable/equatable.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';

enum EmployeesStatus { initial, loading, success, error }

class EmployeesState extends Equatable {
  final EmployeesModel? employee;
  final EmployeesStatus status;

  const EmployeesState({this.employee, this.status = EmployeesStatus.initial});

  EmployeesState copyWith({EmployeesModel? employee, EmployeesStatus? status}) {
    return EmployeesState(
      employee: employee ?? this.employee,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [employee, status];
}
