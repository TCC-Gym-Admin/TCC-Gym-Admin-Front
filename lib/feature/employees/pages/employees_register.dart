import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_gym_admin_front/core/widget/custom_app_bar.dart';
import 'package:tcc_gym_admin_front/feature/employees/cubit/employees_cubit.dart';
import 'package:tcc_gym_admin_front/feature/employees/cubit/employees_state.dart';
import 'package:tcc_gym_admin_front/feature/employees/widgets/employees_register_form.dart';

class EmployeesRegister extends StatefulWidget {
  const EmployeesRegister({super.key});

  @override
  State<EmployeesRegister> createState() => _EmployeesRegisterState();
}

class _EmployeesRegisterState extends State<EmployeesRegister> {
  final cubit = Modular.get<EmployeesCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeesCubit, EmployeesState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: "Novo Funcionário"),
          body: EmployeesRegisterForm(),
        );
      },
    );
  }
}
