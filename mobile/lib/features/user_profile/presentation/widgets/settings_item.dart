import 'package:flutter/material.dart';
import 'package:learnfy/core/theme/app_colors.dart';
import 'package:learnfy/core/theme/app_text_styles.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    this.icon,
    required this.itemName,
    this.userItemsNumber,
    this.onTap,
  });

  final IconData? icon;
  final String itemName;
  final int? userItemsNumber;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.black5,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: AppColors.primary100,
                  size: 25,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: AppTextStyles.heading4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  userItemsNumber != null
                      ? Text(
                          "$userItemsNumber Courses",
                          style: AppTextStyles.bodySmallMedium.copyWith(
                            color: AppColors.black40,
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black60,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
