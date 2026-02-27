import 'package:result_dart/result_dart.dart';
import 'package:tcc_gym_admin_front/core/server/i_server.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';
import 'package:tcc_gym_admin_front/feature/employees/services/interfaces/i_employees.dart';

class EmployeesServices extends IEmployees {
  final IServer server;

  EmployeesServices({required this.server});

  @override
  Future<ResultDart<EmployeesModel, String>> register(
    EmployeesModel employees,
  ) async {
    try {
      final response = await server.post('/employee', data: employees.toJson());
      final result = EmployeesModel.fromJson(response.data);

      return Success(result);
    } catch (e) {
      return Failure('');
    }
  }
}
