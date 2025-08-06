import 'package:flutter/material.dart';

class AuthWithPlatforms extends StatelessWidget {
  const AuthWithPlatforms({
    super.key,
    required this.iconUrl,
    required this.platformName,
    this.onPressed,
  });

  final String iconUrl;
  final String platformName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            Image.network(iconUrl, fit: BoxFit.fill, height: 30),
            SizedBox(width: 39.42),
            Text(
              "Continue with $platformName",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
