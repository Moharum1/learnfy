import 'package:flutter/material.dart';
import 'package:learnfy/core/helper_functions/validator.dart';
import 'package:learnfy/core/theme/app_text_styles.dart';
import 'package:learnfy/core/widgets/custom_app_bar.dart';
import 'package:learnfy/core/widgets/primary_button.dart';
import 'package:learnfy/features/auth/presentation/widgets/auth_text_form_field.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomAppBar(title: 'Forgot Password'),
                  Text(
                    "Don't worry, just enter your e-mail and we will send you the verification code.",
                    style: AppTextStyles.bodyLargeRegular,
                  ),
                  SizedBox(height: 36),
                  AuthTextFormField(
                    label: 'Email',
                    validator: (email) => validateEmail(email!),
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  PrimaryButton(
                    label: 'Forgot your password',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
