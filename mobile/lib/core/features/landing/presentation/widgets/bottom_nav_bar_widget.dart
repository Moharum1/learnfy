import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../colors.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {

  int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: ColorManager.primaryColor,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wechat_outlined, size: 34),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up, size: 34),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp, size: 34),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 34), label: ''),
        ],
      );
  }
}