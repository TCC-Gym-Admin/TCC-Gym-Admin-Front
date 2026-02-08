import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_gym_admin_front/core/widget/liquid_glass.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_cubit.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_state.dart';
import 'package:tcc_gym_admin_front/feature/home/widgets/nav_bar/animated_indicator.dart';
import 'package:tcc_gym_admin_front/feature/home/widgets/nav_bar/bottom_nav_bar.dart';

class HomeNavBar extends StatelessWidget {
  final int selectedIndex;
  HomeNavBar({required this.selectedIndex, super.key});

  final homeCubit = Modular.get<HomeCubit>();

  void onTabSelected(int index) {
    homeCubit.setSelectedIndex(index);
    Modular.to.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    const double navWidth = 180;
    const double indicatorWidth = 80;

    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: navWidth,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    liquidGlass(child: SizedBox(height: 60, width: navWidth)),
                    AnimatedIndicator(
                      selectedIndex: selectedIndex,
                      navWidth: navWidth,
                      indicatorWidth: indicatorWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BottomNavBar(
                            icon: Icons.person,
                            index: 0,
                            onTabSelected: onTabSelected,
                            label: "Funcionários",
                          ),
                          BottomNavBar(
                            index: 1,
                            icon: Icons.attach_money_rounded,
                            onTabSelected: onTabSelected,
                            label: "Pagamentos",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
