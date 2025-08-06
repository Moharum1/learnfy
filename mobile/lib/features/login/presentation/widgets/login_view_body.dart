import 'package:flutter/material.dart';
import 'package:learnfy/features/login/presentation/widgets/auth_with_platforms.dart';
import 'package:learnfy/features/login/presentation/widgets/custom_button.dart';
import 'package:learnfy/features/login/presentation/widgets/custom_divider.dart';
import 'package:learnfy/features/login/presentation/widgets/custom_register.dart';
import 'package:learnfy/features/login/presentation/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  CustomTextFormField(hintText: 'Email'),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'Password',
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Color(0xffC9CECF),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(color: Color(0xffC246BE), fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 35.5),
                  CustomButton(),
                  SizedBox(height: 23.5),
                  CustomRegister(),
                  SizedBox(height: 34),
                  CustomDivider(),
                  SizedBox(height: 16),
                  AuthWithPlatforms(
                    iconUrl:
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                    platformName: 'Google',
                    onPressed: () {},
                  ),
                  SizedBox(height: 16),
                  AuthWithPlatforms(
                    iconUrl:
                        'https://www.freepnglogos.com/uploads/apple-logo-png/file-apple-logo-black-svg-wikimedia-commons-6.png',
                    platformName: 'Apple',
                    onPressed: () {},
                  ),
                  SizedBox(height: 16),
                  AuthWithPlatforms(
                    iconUrl:
                        'https://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19754.png',
                    platformName: 'Facebook',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
