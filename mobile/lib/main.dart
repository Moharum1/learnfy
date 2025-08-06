import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// hello this is aymn shaban
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Allah is one ',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900
        ),),
      ),
    );
  }
}
