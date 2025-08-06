import 'package:flutter/material.dart';
import 'package:learnfy/features/login/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_sharp),
        ),
        title: Text("Login", style: TextStyle(fontSize: 24)),
        centerTitle: true,
      ),
      body: LoginViewBody(),
    );
  }
}
