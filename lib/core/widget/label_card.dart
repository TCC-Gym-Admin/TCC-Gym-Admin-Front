import 'package:flutter/material.dart';
import 'package:tcc_gym_admin_front/core/theme/app_text_style.dart';

class LabelCard extends StatelessWidget {
  final String label;
  final String value;
  const LabelCard({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(label, style: AppTextStyle.bold.small),
        Text(value, style: AppTextStyle.nomal.small),
      ],
    );
  }
}
