import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationField extends StatelessWidget {
  const OTPVerificationField({
    required this.codeController,
    required this.phoneNumber,
    super.key
  });

  final TextEditingController codeController;
  final String phoneNumber;


  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("we sent code to this phone number : $phoneNumber"),
            const SizedBox(
              height: 24,
            ),
            Pinput(
              controller: codeController,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive the code? "),
                TextButton(
                  onPressed: () {
                    
                  },
                  child: const Text("Resend Code"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}