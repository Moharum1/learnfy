import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey.shade300,
            endIndent: 10,
          ),
        ),
        Text('OR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Expanded(
          child: Divider(thickness: 1, color: Colors.grey.shade300, indent: 10),
        ),
      ],
    );
  }
}
