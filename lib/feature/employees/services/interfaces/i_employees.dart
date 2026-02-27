import 'package:result_dart/result_dart.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';

abstract class IEmployees {
  Future<ResultDart<EmployeesModel, String>> register(EmployeesModel employees);
}
