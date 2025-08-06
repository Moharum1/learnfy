import 'package:flutter/material.dart';
import 'package:learnfy/core/theme/app_theme.dart';
import 'package:learnfy/features/auth/presentation/views/forget_pass_page.dart';
import 'package:learnfy/features/auth/presentation/views/on_boarding_view.dart';
import 'features/auth/presentation/views/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      home: Scaffold(
        body: ForgetPasswordView(),
      ),
    );
  }
}
