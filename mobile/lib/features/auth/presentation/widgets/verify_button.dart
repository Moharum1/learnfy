import "package:flutter/material.dart";

import "../../../../core/theme/app_colors.dart";
import "../../../../core/theme/app_text_styles.dart";

class VerifyButton extends StatelessWidget {
  final void Function()? onTap;
  const VerifyButton({
    required this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
      ),
      child: Text(
        'Verify',
        style: AppTextStyles.bodyLargeRegular.copyWith(
          color: AppColors.white
        )
      ),
    );
  }
}
