import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/model/dish_generated_models.dart';
import 'package:food_recipes/presentation/screens/home_screen/dish_screen.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class GeneratedListDishScreen extends StatelessWidget {
  const GeneratedListDishScreen({super.key, required this.dishList});

  final List<DishGeneratedModels> dishList;

  double getPercentage(double a, double b) {
    double total = a + b;
    return (a / total) * 100;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.withOpacity(0.3),
        title: const Text("Yours Dishes are"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepOrange.withOpacity(0.1),
        ),
        child: ListView.builder(
          itemCount: dishList.length,
          itemBuilder: (context, index) {
            final data = dishList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  try {
                    final foodUser = await SpoonacularApi.getFoodData(name: dishList[index].title!);
                    // final foodSummary = await SpoonacularApi.getFoodSummary(dishList[index].id!);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DishScreen(
                          dish: foodUser.results![0],
                        ),
                      ),
                    );
                  } catch (e) {
                    print('An error occurred: $e');
                  }
                }
                ,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset:
                            const Offset(5, 10), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            data.image!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 13,
                        left: width * 0.3,
                        child: SizedBox(
                          width: width * 0.4,
                          child: Text(
                            data.title!,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        left: width * 0.3,
                        child: const Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.pink,
                        ),
                      ),
                      Positioned(
                        bottom: 3,
                        left: width * 0.37,
                        child: Text(
                          data.likes.toString(),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 15,
                        child: Text("Similarity %"),
                      ),
                      Positioned(
                        top: 30,
                        right: 5,
                        child: SizedBox(
                          height: 80,
                          width: 100,
                          child: SleekCircularSlider(
                            appearance: CircularSliderAppearance(
                              counterClockwise: false,
                              customColors: CustomSliderColors(
                                progressBarColors: [
                                  Colors.deepOrange[900]!,
                                  Colors.deepOrange[800]!,
                                  Colors.deepOrange[700]!,
                                  Colors.deepOrange[600]!,
                                  Colors.deepOrange[500]!,
                                  Colors.deepOrange[400]!,
                                  Colors.deepOrange[300]!,
                                ],
                                dotColor: Colors.white,
                                gradientStartAngle: 0,
                                gradientEndAngle: 180,
                              ),
                              customWidths: CustomSliderWidths(
                                progressBarWidth: 12,
                                trackWidth: 10,
                              ),
                              infoProperties: InfoProperties(
                                mainLabelStyle: TextStyle(
                                  color: Colors.deepOrange[900],
                                  fontSize: 18,
                                ),
                                modifier: (double value) {
                                  final roundedValue = value.round();
                                  return '$roundedValue %';
                                },
                              ),
                            ),
                            min: 0,
                            max: 100,
                            initialValue: getPercentage(
                                data.missedIngredientCount!.toDouble(),
                                data.usedIngredientCount!.toDouble()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
