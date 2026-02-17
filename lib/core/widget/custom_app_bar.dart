import 'package:flutter/material.dart';
import 'package:tcc_gym_admin_front/core/theme/app_text_style.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool? isWelcome;
  final String? title;
  const CustomAppBar({this.isWelcome = false, super.key, this.title});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: .start,
          children: widget.isWelcome!
              ? [
                  Text("Olá,", style: AppTextStyle.bold.small),
                  Text("ADMIN", style: AppTextStyle.bold.large),
                ]
              : [Text(widget.title ?? '', style: AppTextStyle.bold.large)],
        ),
      ),
    );
  }
}
