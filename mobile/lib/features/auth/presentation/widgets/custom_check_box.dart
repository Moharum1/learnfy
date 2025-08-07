import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnfy/core/assets.dart';
import 'package:learnfy/core/theme/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: value ? AppColors.primary90 : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: value ? AppColors.primary90 : AppColors.black20,
            width: 1.5,
          ),
        ),
        child: value
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(Assets.checkIcon),
              )
            : null,
      ),
    );
  }
}
