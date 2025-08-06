import 'package:flutter/material.dart';

class CustomRegister extends StatelessWidget {
  const CustomRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: TextStyle(fontSize: 18)),
        TextButton(
          onPressed: () {},
          child: Text(
            "Register",
            style: TextStyle(color: Color(0xffC246BE), fontSize: 18),
          ),
        ),
      ],
    );
  }
}
