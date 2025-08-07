
import 'package:flutter/material.dart';

import '../../../../colors.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Pop',
              fontSize: 19,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 10),
          Icon(icon, color: ColorManager.primaryColor.withOpacity(0.7)),
        ],
      ),
    );
  }
}
