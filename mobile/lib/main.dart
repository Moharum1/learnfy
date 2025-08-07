import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnfy/core/routing/app_router.dart';
import 'package:learnfy/core/routing/app_routes.dart';
import 'package:learnfy/core/theme/app_theme.dart';
import 'package:learnfy/features/auth/presentation/views/forget_pass_view.dart';
import 'package:learnfy/features/auth/presentation/views/on_boarding_view.dart';
import 'features/auth/presentation/views/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



void main() {
  runApp(
    BlocProvider(
      create: (context) => OTPCubit(),
      child: const Learnfy()
    )
  );
}

class Learnfy extends StatelessWidget {
  const Learnfy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      home: EditProfileView(),
      onGenerateRoute:AppRouter.generateRoute,
      initialRoute: AppRoutes.onboarding,
    );
  }
}
