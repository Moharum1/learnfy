import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Do you have an account? ',
          style: AppTextStyles.bodyLargeRegular.copyWith(
            color: AppColors.black60,
          ),
        ),
        Text(
          'Login',
          style: AppTextStyles.bodyLargeMedium.copyWith(
            color: AppColors.primary90,
          ),
        ),
      ],
    );
  }
}
