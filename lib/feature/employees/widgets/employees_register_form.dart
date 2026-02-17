import 'package:flutter/material.dart';
import 'package:tcc_gym_admin_front/core/utils/custom_cpf_formatter.dart';
import 'package:tcc_gym_admin_front/core/utils/custom_money_formatter.dart';
import 'package:tcc_gym_admin_front/core/widget/custom_text_field.dart';

class EmployeesRegisterForm extends StatefulWidget {
  const EmployeesRegisterForm({super.key});

  @override
  State<EmployeesRegisterForm> createState() => _EmployeesRegisterFormState();
}

class _EmployeesRegisterFormState extends State<EmployeesRegisterForm> {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController document = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController role = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController salary = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            CustomTextField(controller: fullname, label: "Nome Completo"),
            SizedBox(height: 20),
            CustomTextField(
              label: "Cpf",
              controller: document,
              keyboardType: TextInputType.number,
              inputFormatters: [CpfInputFormatter()],
            ),
            SizedBox(height: 20),
            SizedBox(
              child: Row(
                mainAxisSize: .max,
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: age,
                      label: "Idade",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: CustomTextField(controller: role, label: "Cargo"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomTextField(controller: address, label: "Endereço"),
            SizedBox(height: 20),
            CustomTextField(
              controller: salary,
              label: "Salário",
              keyboardType: TextInputType.number,
              inputFormatters: [CustomMoneyFormatter()],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
