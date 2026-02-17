import 'package:flutter/material.dart';
import 'package:tcc_gym_admin_front/core/theme/app_colors.dart';

class AnimatedIndicator extends StatelessWidget {
  const AnimatedIndicator({
    super.key,
    required this.selectedIndex,
    required this.navWidth,
    required this.indicatorWidth,
  });

  final int selectedIndex;
  final double navWidth;
  final double indicatorWidth;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      left: selectedIndex == 0
          ? (navWidth / 4) - (indicatorWidth / 2)
          : (navWidth * 3 / 4) - (indicatorWidth / 2),
      child: Container(
        height: 50,
        width: indicatorWidth,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
