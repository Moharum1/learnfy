import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';





class ModelCategoryWidget extends StatelessWidget {
  const ModelCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade100,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text(
                    'التصوير الفوتوغرافي: التقط \nوشارك حياتك',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 21,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' محمد نظمي',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '   • 41 دقيقة ',
                        style: TextStyle(
                          color: AppColors.primary90,
                        ),
                      ),
                      TextSpan(
                        text: 'متبقية',
                        style: TextStyle(color: AppColors.black40),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Transform.rotate(
                  angle: math.pi,
                  child: LinearProgressIndicator(
                    value: 0.27,
                    color: AppColors.primary90,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://scandigital.com/cdn/shop/articles/AdobeStock_296909738_1400x.jpg?v=1612233314',
                  width: 120,
                  height: 120,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: AppColors.primary90,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
