import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorWidget extends StatelessWidget {
  final int pageCount;
  final int currentPage;
  final PageController boardController;

  const PageIndicatorWidget({
    super.key,
    required this.pageCount,
    required this.currentPage,
    required this.boardController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmoothPageIndicator(
          count: pageCount,
          effect: const ExpandingDotsEffect(
            dotWidth: 13,
            dotHeight: 13,
            strokeWidth: 6,
            dotColor: Colors.grey,
            activeDotColor: Colors.black,
          ),
          controller: boardController,
        ),
        const Spacer(),
      ],
    );
  }
}
