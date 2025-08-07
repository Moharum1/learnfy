import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnfy/core/colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 3;
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
                    size: 36,
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
                        image: NetworkImage(
                          'https://img.freepik.com/premium-photo/man-white-suit-stands-front-white-background_745528-2904.jpg?w=996',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 200),
                  const Text(
                    '..!مرحباً بك',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pop',
                    ),
                  ),
                ],
              ),

              const Text(
                'ماذا تود أن تتعلم؟   ',
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
                              'التصوير الفوتوغرافي: التقط \nوشارك حياتك',
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
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://scandigital.com/cdn/shop/articles/AdobeStock_296909738_1400x.jpg?v=1612233314',
                            width: 120,
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: ColorManager.primaryColor,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'فئات موصى بها لك',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text("بناءأ علي إهتماماتك"),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecommendedCard(
                    title: 'السينما',
                    image:
                        'https://blogdesign-recipe.com/wp-content/uploads/2022/01/b29_acce_photoediting.jpg',
                  ),
                  RecommendedCard(
                    title: 'التصميم',
                    image:
                        'https://iranhomedecor.com/wp-content/uploads/2021/12/final-atolieh-T-10.jpg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Pop',
              fontSize: 19,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 10),
          Icon(icon, color: ColorManager.primaryColor.withOpacity(0.7)),
        ],
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final String title;
  final String image;

  const RecommendedCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.42,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.bookmark, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
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
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
