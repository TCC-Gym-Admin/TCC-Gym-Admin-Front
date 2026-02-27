import 'package:flutter/material.dart';
import 'package:tcc_gym_admin_front/core/theme/app_colors.dart';

class AppTextStyle {
  static FontWeightBuilder get bold => FontWeightBuilder(FontWeight.bold);
  static FontWeightBuilder get nomal => FontWeightBuilder(FontWeight.normal);
}

class FontWeightBuilder {
  final FontWeight weight;
  FontWeightBuilder(this.weight);

  TextStyle get small => _style(15);
  TextStyle get medium => _style(20);
  TextStyle get large => _style(25);

  TextStyle _style(double size) => TextStyle(
    fontWeight: weight,
    fontSize: size,
    color: AppColors.primaryTextColor,
  );
}
