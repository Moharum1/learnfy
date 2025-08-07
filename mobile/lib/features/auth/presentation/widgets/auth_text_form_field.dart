import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnfy/core/theme/app_colors.dart';
import 'package:learnfy/core/theme/app_text_styles.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.label,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.obscureText = false,
    required this.validator,
    required this.controller,
  });

  final String label;
  final String? suffixIcon;
  final void Function()? onSuffixIconTap;
  final bool obscureText;
  final String? Function(String?) validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      cursorColor: AppColors.primary90,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.bodyLargeRegular.copyWith(
          color: AppColors.black60,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: AppTextStyles.bodyXSmallRegular.copyWith(
          color: AppColors.primary90,
        ),
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: onSuffixIconTap,
                  child: SvgPicture.asset(
                    suffixIcon!,
                    colorFilter: ColorFilter.mode(
                      AppColors.black40,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
