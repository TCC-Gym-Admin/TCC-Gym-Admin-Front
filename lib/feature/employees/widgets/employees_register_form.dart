import 'package:flutter/material.dart';
import 'package:tcc_gym_admin_front/core/utils/custom_cpf_formatter.dart';
import 'package:tcc_gym_admin_front/core/utils/custom_money_formatter.dart';
import 'package:tcc_gym_admin_front/core/widget/custom_text_field.dart';

class EmployeesRegisterForm extends StatelessWidget {
  const EmployeesRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            CustomTextField(label: "Nome Completo"),
            SizedBox(height: 20),
            CustomTextField(
              label: "Cpf",
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
                      label: "Idade",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(flex: 2, child: CustomTextField(label: "Cargo")),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomTextField(label: "Endereço"),
            SizedBox(height: 20),
            CustomTextField(
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
