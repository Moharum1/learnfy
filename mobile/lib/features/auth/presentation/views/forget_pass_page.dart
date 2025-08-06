import 'package:flutter/material.dart';
import 'package:learnfy/core/theme/app_colors.dart';
import 'package:learnfy/core/theme/app_text_styles.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Center(
                child: Text(
                  "forget Your Password",
                  style: AppTextStyles.heading30,
                ),
              ),
              SizedBox(height: 44),
              SizedBox(
                height: 130,
                width: 130,
                child: Image.asset("assets/icons/forget_pass.jpg"),
              ),
              SizedBox(height: 44),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 39),
                child: _buildTextField(
                  TextEditingController(),
                  "enter Your Email Address",
                  obscureText: false,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 39),
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: تنفيذ عملية التسجيل
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'send',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(
  TextEditingController controller,
  String hintText, {
  bool obscureText = false,
}) {
  return SizedBox(
    height: 60,
    width: 322,
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // الشكل العام
          borderSide: BorderSide.none, // بدون حدود
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // عند التمكين
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // عند الضغط
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
