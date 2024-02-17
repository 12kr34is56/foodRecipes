import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothDot extends StatelessWidget {
  const SmoothDot({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0.64),
      child: SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: const WormEffect(
            activeDotColor: Colors.pink, dotColor: Colors.orangeAccent),
      ),
    );
  }
}
