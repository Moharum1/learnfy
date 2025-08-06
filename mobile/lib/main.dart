import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnfy/core/routing/app_router.dart';
import 'package:learnfy/core/routing/app_routes.dart';
import 'package:learnfy/core/theme/app_theme.dart';
import 'package:learnfy/features/auth/presentation/manager/otp_cubit/otp_cubit.dart';

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
      onGenerateRoute:AppRouter.generateRoute,
      initialRoute: AppRoutes.onboarding,
    );
  }
}