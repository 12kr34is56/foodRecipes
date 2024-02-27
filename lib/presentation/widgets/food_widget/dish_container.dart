import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/model/FoodModel.dart';
import 'package:food_recipes/presentation/screens/home_screen/cuisine_screen/cuisine_bloc/cuisine_bloc.dart';
import 'package:food_recipes/presentation/screens/home_screen/dish_screen.dart';

import '../../screens/home_screen/cuisine_screen/video_bloc/video_bloc.dart';

class DishContainer extends StatelessWidget {
  const DishContainer({
    super.key,
    required this.foodUser,
    required this.index,
  });

  final List<Results> foodUser;
  final int index;

  @override
  Widget build(BuildContext context) {
    final data = foodUser[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: GestureDetector(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DishScreen(
                dish: foodUser[index],
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffffc949), width: 2),
                  borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.cover,
                  width: 170,
                  height: 170,
                  imageUrl: foodUser[index].image!,
                ),
              ),
            ),

            Positioned(
              top: 5,
              left: 5,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: data.vegetarian! ? Colors.green : Colors.red
                ),
              ),
            ),


            Positioned(
                bottom: 13.5,
                child: Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                      backgroundBlendMode: BlendMode.softLight),
                  child: Text(
                    data.title!,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
