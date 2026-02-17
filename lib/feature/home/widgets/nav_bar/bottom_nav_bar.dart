import 'package:flutter/material.dart';
import 'package:tcc_gym_admin_front/core/theme/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTabSelected;
  final int index;
  final int selectedIndex;
  final String label;
  final IconData icon;
  const BottomNavBar({
    required this.onTabSelected,
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () => onTabSelected(index),
        child: Container(
          color: Colors.transparent,
          height: 55,
          width: 55,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Icon(
                icon,
                size: 25,
                color: selectedIndex == index
                    ? AppColors.buttonSecundaryColor
                    : AppColors.buttonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
