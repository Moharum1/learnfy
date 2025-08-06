import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:learnfy/core/helper_functions/validator.dart';
import 'package:learnfy/core/widgets/primary_button.dart';
import 'package:learnfy/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:learnfy/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:learnfy/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/assets.dart';
import '../widgets/dont_have_account_widget.dart';
import '../widgets/terms_and_conditions_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      // appBar: buildAppBar(title: 'New Account'),
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 16.0),
                    AuthTextFormField(
                      label: 'Full Name',
                      validator: (username) => validateUsername(username!),
                      controller: userNameController,
                    ),
                    SizedBox(height: 16.0),
                    AuthTextFormField(
                      label: 'Email',
                      validator: (email) => validateEmail(email!),
                      controller: emailController,
                    ),
                    SizedBox(height: 16.0),
                    BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        return AuthTextFormField(
                          onSuffixIconTap: () => context
                              .read<SignUpCubit>()
                              .togglePasswordVisible(),
                          label: 'Password',
                          suffixIcon: state.isPasswordVisible
                              ? Assets.eyeSlashIcon
                              : Assets.eyeIcon,
                          obscureText: !state.isPasswordVisible,
                          validator: (password) => validatePassword(password!),
                          controller: passwordController,
                        );
                      },
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        BlocBuilder<SignUpCubit, SignUpState>(
                          builder: (context, state) {
                            return CustomCheckbox(
                              value: state.isTermAccepted,
                              onChanged: (value) => context
                                  .read<SignUpCubit>()
                                  .toggleTermAccept(value),
                            );
                          },
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TermsAndConditionsWidget(),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    PrimaryButton(
                      label: 'Create New Account',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          log('Account created successfully');
                        }
                      },
                    ),
                    SizedBox(height: 23.5),
                    DontHaveAccountWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
