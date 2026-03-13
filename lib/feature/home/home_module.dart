import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_gym_admin_front/app/app_module.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_cubit.dart';
import 'package:tcc_gym_admin_front/feature/home/page/home_page.dart';
import 'package:tcc_gym_admin_front/feature/home/services/implements/home_services.dart';
import 'package:tcc_gym_admin_front/feature/home/services/interfaces/i_home_services.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton<HomeCubit>(HomeCubit.new);
    i.addLazySingleton<IHomeServices>(HomeServices.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => HomePage());
  }
}
