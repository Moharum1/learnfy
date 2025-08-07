import 'package:flutter/material.dart';
import 'package:learnfy/core/theme/app_theme.dart';
import 'features/auth/presentation/views/sign_up_page.dart';
import 'package:learnfy/features/auth/presentation/views/on_boarding_view.dart';

void main() {
  runApp(const Learnfy());
}


class Learnfy extends StatelessWidget {
  const Learnfy({super.key});

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      home: Scaffold(
        body: SignUpPage(),
      home: const OnboardingView(),
    );
  }
}

