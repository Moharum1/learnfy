import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'By creating an account, you agree to our ',
        style: AppTextStyles.bodyMediumMedium,
        children: [
          TextSpan(
            text: 'Terms and Conditions.',
            style: AppTextStyles.bodyMediumMedium.copyWith(
              color: AppColors.primary90,
            ),
          ),
        ],
      ),
    );
  }
}
