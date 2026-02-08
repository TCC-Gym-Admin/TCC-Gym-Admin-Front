import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_gym_admin_front/feature/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
  }
}
