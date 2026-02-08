import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_cubit.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_state.dart';
import 'package:tcc_gym_admin_front/feature/home/page/employees_page.dart';
import 'package:tcc_gym_admin_front/feature/home/page/payments_page.dart';
import 'package:tcc_gym_admin_front/feature/home/widgets/nav_bar/home_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeCubit = Modular.get<HomeCubit>();

  List<Widget> get _pages => [EmployeesPage(), PaymentsPage()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(title: Text("")),
          body: _pages[state.selectedIndex],
          bottomNavigationBar: HomeNavBar(selectedIndex: state.selectedIndex),
          floatingActionButton: state.selectedIndex == 0
              ? FloatingActionButton(
                  onPressed: () {},
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                )
              : null,
        );
      },
    );
  }
}
