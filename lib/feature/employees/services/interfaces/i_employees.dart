import 'package:result_dart/result_dart.dart';
import 'package:tcc_gym_admin_front/core/model/app_failure.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';

abstract class IEmployees {
  Future<ResultDart<EmployeesModel, AppFailure>> register(
    EmployeesModel employees,
  );
  Future<ResultDart<String, AppFailure>> edit(EmployeesModel employees);
  Future<ResultDart<EmployeesModel, AppFailure>> getEmployees();
}
