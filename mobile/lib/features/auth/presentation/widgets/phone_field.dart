import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;

  const PhoneField({
    required this.phoneController,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: phoneController,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.phone,
      showCountryFlag: true,
      showDropdownIcon: false,
      flagsButtonPadding: EdgeInsets.all(16),
      decoration: const InputDecoration(
        hintText: 'Phone Number',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
      initialCountryCode: 'US',
    );
  }
}
