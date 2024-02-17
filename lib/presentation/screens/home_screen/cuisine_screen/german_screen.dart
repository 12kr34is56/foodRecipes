import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/presentation/screens/home_screen/cuisine_screen/indian_screen.dart';
import 'package:food_recipes/presentation/widgets/food_widget/dish_container.dart';

class GermanScreen extends StatelessWidget {
  const GermanScreen({super.key, required this.foodUser});
  final List<FoodUser> foodUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('German'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xffffecc7)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: foodUser.length,
            itemBuilder: (context, index) {
              return DishContainer(foodUser: foodUser, index: index);
            },
          ),
        ),
      ),
    );
  }
}
