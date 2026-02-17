import 'package:flutter/material.dart';
import 'package:tcc_gym_admin_front/feature/employees/widgets/employees_register_form.dart';

class EmployeesRegister extends StatefulWidget {
  const EmployeesRegister({super.key});

  @override
  State<EmployeesRegister> createState() => _EmployeesRegisterState();
}

class _EmployeesRegisterState extends State<EmployeesRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: EmployeesRegisterForm());
  }
}
