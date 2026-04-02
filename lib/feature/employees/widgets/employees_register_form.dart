import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tcc_gym_admin_front/core/theme/app_colors.dart';
import 'package:tcc_gym_admin_front/core/theme/app_text_style.dart';
import 'package:tcc_gym_admin_front/core/utils/custom_clean_formatter.dart';
import 'package:tcc_gym_admin_front/core/utils/custom_cpf_formatter.dart';
import 'package:tcc_gym_admin_front/core/utils/custom_money_formatter.dart';
import 'package:tcc_gym_admin_front/core/utils/validators.dart';
import 'package:tcc_gym_admin_front/core/widget/custom_dialog.dart';
import 'package:tcc_gym_admin_front/core/widget/custom_dropdown.dart';
import 'package:tcc_gym_admin_front/core/widget/custom_text_field.dart';
import 'package:tcc_gym_admin_front/feature/employees/cubit/employees_cubit.dart';
import 'package:tcc_gym_admin_front/feature/employees/cubit/employees_state.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_cubit.dart';

class EmployeesRegisterForm extends StatefulWidget {
  const EmployeesRegisterForm({super.key});

  @override
  State<EmployeesRegisterForm> createState() => _EmployeesRegisterFormState();
}

class _EmployeesRegisterFormState extends State<EmployeesRegisterForm> {
  final employeeCubit = Modular.get<EmployeesCubit>();
  final cubit = Modular.get<HomeCubit>();

  String? errorName;
  String? errorDocument;
  String? errorAge;
  String? errorRole;
  String? errorAddress;
  String? errorSalary;
  bool isValid = true;
  setModel() {
    final employee = EmployeesModel(
      address: address.text,
      age: int.parse(age.text),
      document: CustomCleanFormatter.cleanDocument(document.text),
      fullname: fullname.text,
      role: employeeCubit.selectPosition(selectedRole),
      salary: CustomCleanFormatter.cleanMoney(salary.text),
    );
    employeeCubit.updateEmployee(employee);
  }

  void registerEmployee() async {
    final result = await employeeCubit.registerEmployee();
    if (result) {
      CustomDialog.showSuccess(
        context,
        message: 'Funcionário foi criado com sucesso!',
      );
      Future.delayed(Duration(seconds: 2)).then((value) {
        Modular.to.pop();
        Modular.to.pop();
        cubit.getEmployees();
      });
    } else {
      CustomDialog.showFailure(
        context,
        message: 'Algo de errado aconteceu! Verifique todos os campos',
      );
    }
  }

  validatedForm() {
    errorName = null;
    errorDocument = null;
    errorAge = null;
    errorRole = null;
    errorAddress = null;
    errorSalary = null;
    if (!validateFullName(fullname.text)) {
      isValid = false;
      errorName = 'Campo nome é obrigatório';
    }
    if (address.text.isEmpty) {
      isValid = false;
      errorAddress = 'Campo endereço é obrigatório';
    }
    if (age.text.isEmpty) {
      isValid = false;
      errorAge = 'Campo idade é obrigatório';
    }
    if (!validateDocument(document.text)) {
      isValid = false;
      errorDocument = 'Campo CPF é obrigatório';
    }
    if (selectedRole == null || selectedRole == '') {
      isValid = false;
      errorRole = 'Campo Cargo é obrigatório';
    }
    if (salary.text.isEmpty) {
      isValid = false;
      errorSalary = 'Campo salário é obrigatório';
    }
    isValid = true;
    setState(() {});
  }

  final TextEditingController fullname = TextEditingController();
  final TextEditingController document = TextEditingController();
  final TextEditingController age = TextEditingController();
  String? selectedRole;
  final TextEditingController address = TextEditingController();
  final TextEditingController salary = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeesCubit, EmployeesState>(
      bloc: employeeCubit,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: fullname,
                  label: "Nome Completo",
                  error: errorName,
                  onChange: (c) {
                    validatedForm();
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: "Cpf",
                  controller: document,
                  keyboardType: TextInputType.number,
                  inputFormatters: [CpfInputFormatter()],
                  error: errorDocument,
                  onChange: (c) {
                    validatedForm();
                  },
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
                          error: errorAge,
                          onChange: (c) {
                            validatedForm();
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: CustomStringDropdown(
                          value: selectedRole,
                          label: "Cargo",
                          items: employeeCubit.positions,
                          onChanged: (value) {
                            selectedRole = value;
                            validatedForm();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: address,
                  label: "Endereço",
                  error: errorAddress,
                  onChange: (c) {
                    validatedForm();
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: salary,
                  label: "Salário",
                  keyboardType: TextInputType.number,
                  inputFormatters: [CustomMoneyFormatter()],
                  error: errorSalary,
                  onChange: (c) {
                    validatedForm();
                  },
                ),
                SizedBox(height: 20),

                InkWell(
                  onTap: isValid
                      ? () async {
                          setModel();
                          registerEmployee();
                        }
                      : () {},
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: state.status == EmployeesStatus.loading
                          ? AppColors.disableButton
                          : AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: state.status == EmployeesStatus.loading
                          ? LoadingAnimationWidget.waveDots(
                              color: Colors.white,
                              size: 40,
                            )
                          : Text(
                              'Registrar',
                              style: AppTextStyle.bold.medium.copyWith(
                                color: AppColors.background,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
