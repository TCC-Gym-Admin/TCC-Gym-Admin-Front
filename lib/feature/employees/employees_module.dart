import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_gym_admin_front/app/app_module.dart';
import 'package:tcc_gym_admin_front/feature/employees/cubit/employees_cubit.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';
import 'package:tcc_gym_admin_front/feature/employees/pages/employees_register.dart';
import 'package:tcc_gym_admin_front/feature/employees/services/implementations/employees_services.dart';
import 'package:tcc_gym_admin_front/feature/employees/services/interfaces/i_employees.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_cubit.dart';

class EmployeesModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton<EmployeesCubit>(EmployeesCubit.new);
    i.addLazySingleton<IEmployees>(EmployeesServices.new);
    i.addLazySingleton<HomeCubit>(HomeCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) =>
          EmployeesRegister(employee: Modular.args.data as EmployeesModel),
    );
  }
}
