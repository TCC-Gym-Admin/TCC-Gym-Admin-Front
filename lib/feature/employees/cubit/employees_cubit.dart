import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_gym_admin_front/feature/employees/cubit/employees_state.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';
import 'package:tcc_gym_admin_front/feature/employees/services/interfaces/i_employees.dart';

class EmployeesCubit extends Cubit<EmployeesState> {
  final IEmployees services;
  EmployeesCubit({required this.services}) : super(const EmployeesState());

  final positions = const ["Professor", "Recepcionista", "Personal", "Gerente"];

  Future<bool> registerEmployee() async {
    emit(state.copyWith(status: EmployeesStatus.loading));

    final response = await services.register(state.employee!);

    return response.fold(
      (success) {
        emit(state.copyWith(status: EmployeesStatus.success));
        return true;
      },
      (error) {
        emit(state.copyWith(status: EmployeesStatus.error));
        return false;
      },
    );
  }

  updateEmployee(EmployeesModel? employee) {
    emit(state.copyWith(employee: employee));
  }
}
