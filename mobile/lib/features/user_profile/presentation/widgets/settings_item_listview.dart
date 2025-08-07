import 'package:flutter/material.dart';
import 'package:learnfy/features/user_profile/presentation/widgets/settings_item.dart';

class SettingsItemListView extends StatelessWidget {
  SettingsItemListView({
    super.key,
  });

  final List<String> itemNames = [
    "Courses",
    "Favourite Courses",
    "Download List",
    "My Subscribtions",
    "Change Language",
    "Settings",
    "Help & Technical Support",
  ];

  final List<IconData> icons = [
    Icons.menu_book,
    Icons.bookmark_add_rounded,
    Icons.file_download,
    Icons.subscriptions,
    Icons.language_rounded,
    Icons.hexagon_rounded,
    Icons.question_mark,
  ];

  final List<int> userItemsNumber = [7, 20, 13];

  @override
  Widget build(BuildContext context) {
    final List<void Function()?> onTap = [
      () {},
      () {},
      () {},
      () {},
      () {},
      () {},
      () {},
    ];
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (context, index) {
        return SettingsItem(
          onTap: onTap[index],
          itemName: itemNames[index],
          icon: icons[index],
          userItemsNumber: index < userItemsNumber.length
              ? userItemsNumber[index]
              : null,
        );
      },
    );
  }
}
