import 'package:flutter/material.dart';
import 'package:tcc_gym_admin_front/core/theme/app_colors.dart';

class CustomStringDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String? label;
  final String? error;
  final Function(String?) onChanged;

  const CustomStringDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.label,
    required this.onChanged,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        if (label != null)
          Column(
            children: [
              Text(
                label!.toUpperCase(),
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        DropdownButtonFormField<String>(
          initialValue: value,
          hint: Text(
            'Selecione um cargo',
            style: TextStyle(color: AppColors.primaryTextColor.withAlpha(80)),
          ),
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
            focusColor: AppColors.inputColors,
            hoverColor: AppColors.inputColors,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.inputColors),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.inputColors),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorText: error,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
              .toList(),
          selectedItemBuilder: (context) {
            return items.map((item) {
              return Text(
                item,
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
          onChanged: onChanged,
        ),
      ],
    );
  }
}
