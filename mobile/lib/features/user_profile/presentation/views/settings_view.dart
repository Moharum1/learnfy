import 'package:flutter/material.dart';
import 'package:learnfy/core/theme/app_text_styles.dart';
import 'package:learnfy/features/user_profile/presentation/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Edit Profile",
          style: AppTextStyles.heading3,
        ),
        centerTitle: true,
      ),
      body: SettingsViewBody(),
    );
  }
}
