import 'package:result_dart/result_dart.dart';
import 'package:tcc_gym_admin_front/core/model/app_failure.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';

abstract class IHomeServices {
  Future<ResultDart<List<EmployeesModel>, AppFailure>> getEmployees();
  Future<ResultDart<String, AppFailure>> deleteEmployees(String id);
}
