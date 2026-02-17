import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_gym_admin_front/core/theme/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarThemeData(
          backgroundColor: AppColors.background,
          actionsIconTheme: IconThemeData(color: AppColors.buttonColor),
          iconTheme: IconThemeData(color: AppColors.buttonColor),
        ),
      ),
      routerConfig: Modular.routerConfig,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(data: MediaQuery.of(context), child: child!);
      },
    );
  }
}
