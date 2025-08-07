import 'package:flutter/material.dart';
import 'package:learnfy/features/auth/presentation/views/on_boarding_view.dart';
import 'package:learnfy/features/auth/presentation/views/otp_screen.dart';
import 'package:learnfy/features/auth/presentation/views/sign_up_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("login screen"),
            ),
          ),
      );
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case AppRoutes.otp:
        return MaterialPageRoute(builder: (_) => const OTPScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text("Not Found"))),
        );
    }
  }
}
