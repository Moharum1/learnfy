import 'package:flutter/material.dart';
import 'package:learnfy/core/assets.dart';
import 'package:learnfy/core/theme/app_text_styles.dart';
import 'package:learnfy/features/user_profile/presentation/views/settings_view.dart';

class UserDataCard extends StatelessWidget {
  const UserDataCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.shade50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            child: Image.asset(
              Assets.profileImg,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mahmoud Mostafa",
                style: AppTextStyles.heading5.copyWith(
                  // color: Colors.black,
                ),
              ),
              Text(
                "Sign in",
                style: AppTextStyles.bodyLargeRegular,
              ),
            ],
          ),
          SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsView()),
              );
            },
            child: Text(
              "Edit Profile",
              style: AppTextStyles.bodyLargeRegular.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
