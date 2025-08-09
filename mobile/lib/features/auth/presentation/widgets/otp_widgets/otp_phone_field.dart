import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';


class OTPPhoneField extends StatelessWidget {
  const OTPPhoneField({
    required this.phoneController,
    super.key
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context){

  return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "we will send you one-time \n password to this mobile number",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            IntlPhoneField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              showCountryFlag: true,
              showDropdownIcon: false,
              flagsButtonPadding: EdgeInsets.all(16),
              decoration: const InputDecoration(
                hintText: 'Phone Number',
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
              initialCountryCode: 'US',
            ),
          ],
        ),
      ),
    );
  }
}