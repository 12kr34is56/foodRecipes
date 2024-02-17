import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';

class FoodSummaryWidget extends StatelessWidget {
  const FoodSummaryWidget({
    super.key,
    required this.summary,
  });

  final FoodSummary summary;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 330,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.4)),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Text(
              summary.summary,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}