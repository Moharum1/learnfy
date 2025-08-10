import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import '../../data/models/onboarding_page_entity.dart';
class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPageEntity page;

  const OnboardingPageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width *.79,
            child: SvgPicture.asset(page.logo)),
        Expanded(
          child: SizedBox(
            height: 200,
            child: Lottie.asset(
              page.imagePath,
              width: 300,
              height: 300,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          page.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          page.description,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black38,
          ),
        ),
        const SizedBox(height: 45),
      ],
    );
  }
}