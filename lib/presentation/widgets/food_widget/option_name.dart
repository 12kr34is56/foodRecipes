
import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/presentation/screens/home_screen/cuisine_screen/cuisine.dart';

class OptionNames extends StatelessWidget {
  const OptionNames({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          TextButton(
              onPressed: () {
                SpoonacularApi.getFoodData(name: name).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>IndianScreen(foodUser: value.results!))));
              },
              child: const Text(
                "View All",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              )),
        ],
      ),
    );
  }
}
