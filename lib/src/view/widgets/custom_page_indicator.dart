import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  final int count;
  final PageController controller;

  const CustomPageIndicator({
    super.key,
    required this.count,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final mainColor = Theme.of(context).primaryColor;

    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: SwapEffect(
        dotColor: mainColor.withAlpha(100),
        activeDotColor: mainColor,
        dotWidth: 8,
        dotHeight: 8,
        spacing: 5,
      ),
    );
  }
}
