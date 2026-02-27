import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:result_dart/result_dart.dart';
import 'package:tcc_gym_admin_front/feature/employees/cubit/employees_state.dart';
import 'package:tcc_gym_admin_front/feature/employees/services/interfaces/i_employees.dart';

class EmployeesCubit extends Cubit<EmployeesState> {
  final IEmployees services;
  EmployeesCubit({required this.services}) : super(const EmployeesState());

  Future<void> registerEmployee() async {
    final response = services.register(state.employee!);

    response.fold(
      (success) {
        emit(state.copyWith(status: EmployeesStatus.success));
      },
      (error) {
        emit(state.copyWith(status: EmployeesStatus.error));
      },
    );
  }

  updateEmployee() {}
}
