import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_gym_admin_front/feature/employees/pages/employees_register.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_cubit.dart';

class EmployeesModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
    i.addLazySingleton<HomeCubit>(HomeCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => EmployeesRegister());
  }
}
