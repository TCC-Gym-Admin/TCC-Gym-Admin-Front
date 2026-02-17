import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_gym_admin_front/feature/employees/cubit/employees_cubit.dart';
import 'package:tcc_gym_admin_front/feature/employees/pages/employees_register.dart';

class EmployeesModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
    i.addLazySingleton<EmployeesCubit>(EmployeesCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => EmployeesRegister());
  }
}
