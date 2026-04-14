import 'package:result_dart/result_dart.dart';
import 'package:tcc_gym_admin_front/core/model/app_failure.dart';
import 'package:tcc_gym_admin_front/core/server/i_server.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';
import 'package:tcc_gym_admin_front/feature/home/services/interfaces/i_home_services.dart';

class HomeServices extends IHomeServices {
  final IServer server;

  HomeServices({required this.server});

  @override
  Future<ResultDart<List<EmployeesModel>, AppFailure>> getEmployees() async {
    try {
      final response = await server.get('/employee');

      List<EmployeesModel> employees = [];

      for (var employee in response.data) {
        employees.add(EmployeesModel.fromJson(employee));
      }

      return Success(employees);
    } catch (e) {
      return Failure(AppFailure(message: "Erro inesperado", statusCode: 400));
    }
  }

  @override
  Future<ResultDart<String, AppFailure>> deleteEmployees(String id) async {
    try {
      final response = await server.delete('/employee/$id');

      return Success('');
    } catch (e) {
      return Failure(AppFailure(message: "Erro inesperado", statusCode: 400));
    }
  }
}
