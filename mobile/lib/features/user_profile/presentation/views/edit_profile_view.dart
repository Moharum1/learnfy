import 'package:flutter/material.dart';
import 'package:learnfy/core/theme/app_text_styles.dart';
import 'package:learnfy/features/user_profile/presentation/widgets/user_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Settings",
          style: AppTextStyles.heading3,
        ),
        centerTitle: true,
      ),
      body: UserProfileViewBody(),
    );
  }
}
