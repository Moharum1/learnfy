import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonName,
    required this.color,
    required this.buttonNameFontColor,
    required this.buttonNameFontSize,
    required this.height,
    required this.width,
    this.onPressed,
  });

  final String buttonName;
  final Color buttonNameFontColor;
  final double buttonNameFontSize;
  final Color color;
  final double height;
  final double width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
            color: buttonNameFontColor,
            fontSize: buttonNameFontSize,
          ),
        ),
      ),
    );
  }
}
