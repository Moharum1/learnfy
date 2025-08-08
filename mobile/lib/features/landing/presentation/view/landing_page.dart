import 'package:flutter/material.dart';
import '../widgets/category_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/model_category_widget.dart';
import '../widgets/recommended_card.dart';
import '../widgets/search_text_form_field.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomAppBar(),
              const SizedBox(height: 16),
              const SearchTextFormField(),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryButton(title: 'الرياضة', icon: Icons.sports_soccer),
                    SizedBox(width:5),
                    CategoryButton(title: 'الفنون', icon: Icons.brush),
                    SizedBox(width:5),
                    CategoryButton(title: 'الطبخ', icon: Icons.restaurant),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'فئة حديثة',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 12),
              const ModelCategoryWidget(),
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
      );
  }
}
