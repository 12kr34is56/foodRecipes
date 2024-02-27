import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';

import '../../screens/home_screen/food_nutrition_screen.dart';

class FindTheNutrition extends StatefulWidget {
  const FindTheNutrition({Key? key}) : super(key: key);

  @override
  State<FindTheNutrition> createState() => _FindTheNutritionState();
}

class _FindTheNutritionState extends State<FindTheNutrition> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      title: const Text('Find The Nutrition'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: 'Enter the food name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            SpoonacularApi.getSingleFoodData(name: _controller.text)
                .then((data) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodNutritionScreen(
                      name: _controller.text, foodData: data),
                ),
              ).then((value) {
                _controller.clear();
                Navigator.pop(context);
              });
            });
          },
          child: const Text('Find'),
        ),
      ],
    );
  }
}
