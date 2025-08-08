import 'package:flutter/material.dart';
import 'package:learnfy/features/user_profile/presentation/widgets/settings_item_listview.dart';
import 'package:learnfy/features/user_profile/presentation/widgets/user_data_card.dart';

class UserProfileViewBody extends StatelessWidget {
  const UserProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserDataCard(),
                SettingsItemListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
