import 'package:flutter/material.dart';
import 'package:learnfy/core/theme/app_colors.dart';
import 'package:learnfy/core/widgets/custom_button.dart';
import 'package:learnfy/core/widgets/custom_text_form_field.dart';
import 'package:learnfy/features/user_profile/presentation/widgets/user_avatar.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                Center(child: UserAvatar()),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(hintText: "Full name"),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(hintText: "Email"),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(hintText: "Phone number"),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hintText: "Password",
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
                SizedBox(
                  height: 150,
                ),
                CustomButton(
                  onPressed: () {},
                  buttonName: "Save Changes",
                  color: AppColors.primary100,
                  buttonNameFontColor: AppColors.black5,
                  buttonNameFontSize: 20,
                  height: 60,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
