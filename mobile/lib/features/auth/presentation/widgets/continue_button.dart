import "package:flutter/material.dart";
import "package:learnfy/core/theme/app_text_styles.dart";

import "../../../../core/theme/app_colors.dart";

class ContinueButton extends StatelessWidget {
  final void Function()? onTap;
  const ContinueButton({
    required this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style:Theme.of(context).elevatedButtonTheme.style!,
      child: Text(
        'Continue',
        style: AppTextStyles.bodyLargeRegular.copyWith(
          color: AppColors.white
        )
      ),
    );
  }
}
