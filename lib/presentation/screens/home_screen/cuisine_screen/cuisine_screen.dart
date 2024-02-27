import 'package:flutter/material.dart';
import 'package:food_recipes/presentation/widgets/food_widget/dish_container.dart';
import '../../../../model/FoodModel.dart';

class CuisineScreen extends StatelessWidget {
  const CuisineScreen({super.key, required this.foodUser, required this.cuisineName});

  final List<Results> foodUser;
  final String cuisineName ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffe0a1),
        title: Text(
          cuisineName,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xffffecc7)),
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


