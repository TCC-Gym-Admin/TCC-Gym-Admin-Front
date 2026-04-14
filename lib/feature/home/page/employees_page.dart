import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_gym_admin_front/core/theme/app_colors.dart';
import 'package:tcc_gym_admin_front/core/theme/app_text_style.dart';
import 'package:tcc_gym_admin_front/core/utils/custom_cpf_formatter.dart';
import 'package:tcc_gym_admin_front/core/utils/custom_mask.dart';
import 'package:tcc_gym_admin_front/core/utils/validators.dart';
import 'package:tcc_gym_admin_front/core/widget/label_card.dart';
import 'package:tcc_gym_admin_front/core/widget/swipe_card.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_cubit.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_state.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  final cubit = Modular.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.buttonColor),
          );
        }
        if (state.status == HomeStatus.failure) {
          return Center(
            child: Text(
              'Nenhum funcionário disponivél.',
              style: AppTextStyle.bold.small,
            ),
          );
        }
        return ListView.separated(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemCount: state.employee.length,
          itemBuilder: (context, index) {
            final employee = state.employee[index];
            return GestureDetector(
              onTap: () {
                final model = EmployeesModel(
                  address: employee.address,
                  age: employee.age,
                  document: employee.document,
                  fullname: employee.fullname,
                  salary: employee.salary,
                  role: employee.role,
                  id: employee.id,
                );
                Modular.to.pushNamed('/employees', arguments: model);
              },
              child: SwipeCard(
                onDismissed: () async {
                  await cubit.deleteEmployees(employee.id.toString());
                },
                keyIndex: state.employee[index].document.toString(),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.bannerCard,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            employeePosition(state.employee[index].role ?? ''),
                            style: AppTextStyle.bold.small.copyWith(
                              color: AppColors.background,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundSecundary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: .center,
                              crossAxisAlignment: .start,
                              children: [
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    LabelCard(
                                      label: 'Nome',
                                      value: state.employee[index].fullname
                                          .toString(),
                                    ),
                                    LabelCard(
                                      label: 'Idade',
                                      value: state.employee[index].age
                                          .toString(),
                                    ),
                                    LabelCard(
                                      label: 'CPF',
                                      value: CpfInputFormatter().formatCpf(
                                        state.employee[index].document
                                            .toString(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),

                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    LabelCard(
                                      label: 'Endereço',
                                      value:
                                          state.employee[index].address ?? '',
                                    ),
                                    LabelCard(
                                      label: 'Salário',
                                      value: CustomMask.realMask(
                                        state.employee[index].salary ?? 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
