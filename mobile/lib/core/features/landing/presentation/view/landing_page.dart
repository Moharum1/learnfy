import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnfy/core/colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.notifications_on_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorManager.primaryColor,
                          ColorManager.primaryColor.withOpacity(0.2),
                        ],
                      ),

                      color: ColorManager.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorManager.primaryColor,
                        width: 2.5,
                      ),
                      image: const DecorationImage(
                        image: NetworkImage('https://i.imgur.com/BoN9kdC.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 200),
                  const Text(
                    '..!مرحباً بك',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const Text(
                'ماذا تود أن تتعلم؟',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  hintText: 'البحث عن كورسات',
                  hintStyle: TextStyle(
                    // fontFamily: ,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  suffixIcon: Transform.rotate(
                    angle: math.pi / 2,
                    child: const Icon(CupertinoIcons.search, size: 30),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CategoryButton(title: 'الرياضة', icon: Icons.sports_soccer),
                  CategoryButton(title: 'الفنون', icon: Icons.brush),

                  CategoryButton(title: 'الطبخ', icon: Icons.restaurant),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'فئة حديثة',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Text(
                              '            التصوير الفوتوغرافي: التقط \nوشارك حياتك',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 21,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: ' محمد نظمي',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '   • 41 دقيقة ',
                                  style: TextStyle(
                                    color: ColorManager.primaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'متبقية',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Transform.rotate(
                            angle: math.pi,
                            child: LinearProgressIndicator(
                              value: 0.27,
                              color: ColorManager.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://i.imgur.com/BZmPx8z.png',
                        width: 85,
                        height: 85,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'فئات موصى بها لك',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecommendedCard(
                    title: 'التصميم',
                    imageUrl: 'https://i.imgur.com/AD3MbBi.png',
                  ),
                  RecommendedCard(
                    title: 'السينما',
                    imageUrl: 'https://i.imgur.com/SYnh9nC.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: ColorManager.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(title),

          const SizedBox(width: 10),
          Icon(icon, color: ColorManager.primaryColor.withOpacity(0.7)),
        ],
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const RecommendedCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
