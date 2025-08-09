import 'package:flutter/material.dart';
import 'package:learnfy/features/landing/presentation/view/landing_page.dart';
import 'core/theme/app_colors.dart';


class MainScreen extends StatefulWidget{
  const MainScreen({super.key});


  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{

  int _selectedIndex = 0;

  List<Widget> screens = [
    LandingPage(),
    Scaffold(
      body: Center(
        child: Text("second page"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("third page"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("fourth page"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("fifth page"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary60,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 34),
            label: ''
          ),
        ].reversed.toList(),
      ),
    );
  }
}