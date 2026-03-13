import 'package:result_dart/result_dart.dart';
import 'package:tcc_gym_admin_front/core/model/app_failure.dart';
import 'package:tcc_gym_admin_front/core/server/i_server.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';
import 'package:tcc_gym_admin_front/feature/employees/services/interfaces/i_employees.dart';

class EmployeesServices extends IEmployees {
  final IServer server;

  EmployeesServices({required this.server});

  @override
  Future<ResultDart<EmployeesModel, AppFailure>> register(
    EmployeesModel employees,
  ) async {
    try {
      final response = await server.post('/employee', data: employees.toJson());
      final result = EmployeesModel.fromJson(response.data);

      return Success(result);
    } catch (e) {
      return Failure(AppFailure(message: "Erro inesperado", statusCode: 400));
    }
  }

  @override
  Future<ResultDart<EmployeesModel, AppFailure>> getEmployees() async {
    try {
      final response = await server.get('/employee');
      final result = EmployeesModel.fromJson(response.data);

      return Success(result);
    } catch (e) {
      return Failure(AppFailure(message: "Erro inesperado", statusCode: 400));
    }
  }
}
