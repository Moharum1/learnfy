import 'package:flutter/material.dart';
import 'package:learnfy/core/theme/app_colors.dart';
import 'package:learnfy/core/theme/app_text_styles.dart';

import '../../../../core/routing/app_routes.dart';



class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.notifications_on_rounded, size: 36, color: AppColors.black100),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, AppRoutes.editprofile);
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary90,
                      AppColors.primary20
                    ],
                  ),
              
                  color: AppColors.primary90,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary90,
                    width: 2.5,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://img.freepik.com/premium-photo/man-white-suit-stands-front-white-background_745528-2904.jpg?w=996',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 30,
                height: 30,
              ),
            ),
            Spacer(),
            const Text(
              '..!مرحباً بك',
              style: AppTextStyles.heading3,
              ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: const Text(
            'ماذا تود أن تتعلم؟ ',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
