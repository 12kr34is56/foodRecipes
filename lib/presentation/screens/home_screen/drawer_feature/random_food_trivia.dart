import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';

import '../../../widgets/food_widget/back_button_widget.dart';

class RandomFoodTrivia extends StatefulWidget {
  RandomFoodTrivia({super.key, required this.name});
  String name;

  @override
  State<RandomFoodTrivia> createState() => _RandomFoodTriviaState();
}

class _RandomFoodTriviaState extends State<RandomFoodTrivia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/j1.jpg'),
              fit: BoxFit.cover,
            )),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: BackButtonWidget(),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Random Food Trivia",style: TextStyle(fontSize: 36),),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(widget.name,style: TextStyle(fontSize: 24),),
                        )),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.9),
                    ),
                    child: TextButton(
                      onPressed: () {
                        SpoonacularApi.getRandomJokes().then((value) {
                          setState(() {
                            widget.name = value;
                          });
                        });
                      },
                      child: const Text('Generate More',style: TextStyle(color: Colors.white),),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
