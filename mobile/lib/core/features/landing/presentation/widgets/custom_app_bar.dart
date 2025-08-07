import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.notifications_on_rounded, size: 36, color: Colors.black),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorManager.primaryColor,
                    ColorManager.primaryColor.withOpacity(0.2),
                  ],
                ),

                color: ColorManager.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorManager.primaryColor,
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
            SizedBox(width: 200),
            const Text(
              '..!مرحباً بك',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pop',
              ),
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
