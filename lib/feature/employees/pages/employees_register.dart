import 'package:flutter/material.dart';
import 'package:tcc_gym_admin_front/core/widget/custom_app_bar.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';
import 'package:tcc_gym_admin_front/feature/employees/widgets/employees_register_form.dart';

class EmployeesRegister extends StatefulWidget {
  final EmployeesModel? employee;
  const EmployeesRegister({super.key, this.employee});

  @override
  State<EmployeesRegister> createState() => _EmployeesRegisterState();
}

class _EmployeesRegisterState extends State<EmployeesRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Novo Funcionário"),
      body: EmployeesRegisterForm(employee: widget.employee),
    );
  }
}
