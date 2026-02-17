import 'package:flutter/material.dart';
import 'package:tcc_gym_admin_front/core/theme/app_colors.dart';

class BackgroundToggle extends StatelessWidget {
  const BackgroundToggle({super.key, required this.navWidth});

  final double navWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: navWidth,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.buttonColor, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
