import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/model/FoodModel.dart';
import 'package:food_recipes/model/nutrition_model.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen(
      {super.key, required this.nutrition, required this.dish});

  final NutritionModel nutrition;
  final Results dish;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text(dish.title!,style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/t4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: height * 0.16,
                  width: width * 0.49,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 3.0,
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.green[300]!,
                        Colors.green[200]!,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Calories",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Max ${nutrition.calories!.confidenceRange95Percent!.max!.round()} cal",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Min ${nutrition.calories!.confidenceRange95Percent!.min!.round()} cal",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    counterClockwise: true,
                    customColors: CustomSliderColors(
                      progressBarColors: [
                        Colors.green[900]!,
                        Colors.green[800]!,
                        Colors.green[700]!,
                        Colors.green[600]!,
                        Colors.green[500]!,
                        Colors.green[400]!,
                        Colors.green[300]!,
                        Colors.green[200]!,
                      ],
                      trackColor: Colors.green[100],
                      dotColor: Colors.white,
                      gradientStartAngle: 0,
                      gradientEndAngle: 180,
                    ),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 12,
                      trackWidth: 10,
                      handlerSize: 4,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "calories",
                      modifier: (double value) {
                        final roundedValue = value.round();
                        return '$roundedValue';
                      },
                    ),
                  ),
                  min: nutrition.calories!.confidenceRange95Percent!.min! - 100,
                  max: nutrition.calories!.confidenceRange95Percent!.max! + 100,
                  initialValue: nutrition.calories!.value!,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    counterClockwise: false,
                    customColors: CustomSliderColors(
                      progressBarColors: [
                        Colors.orange[900]!,
                        Colors.orange[800]!,
                        Colors.orange[700]!,
                        Colors.orange[600]!,
                        Colors.orange[500]!,
                        Colors.orange[400]!,
                        Colors.orange[300]!,
                        Colors.orange[200]!,
                      ],
                      trackColor: Colors.orange[100],
                      dotColor: Colors.white,
                      gradientStartAngle: 0,
                      gradientEndAngle: 180,
                    ),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 12,
                      trackWidth: 10,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "carbs",
                      modifier: (double value) {
                        final roundedValue = value.round();
                        return '$roundedValue';
                      },
                    ),
                  ),
                  min: nutrition.carbs!.confidenceRange95Percent!.min! -100,
                  max: nutrition.carbs!.confidenceRange95Percent!.max! +100,
                  initialValue: nutrition.carbs!.value!,
                ),
                Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 3.0,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.orange[300]!,
                          Colors.orange[200]!,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Carbs",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Max ${nutrition.carbs!.confidenceRange95Percent!.max!.round()} g",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Min ${nutrition.carbs!.confidenceRange95Percent!.min!.round()} g",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.purple[300]!,
                        Colors.purple[200]!,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Protein",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Max ${nutrition.protein!.confidenceRange95Percent!.max!.round() +100} g",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Min ${nutrition.protein!.confidenceRange95Percent!.min!.round() -100} g",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    counterClockwise: true,
                    customColors: CustomSliderColors(),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 12,
                      trackWidth: 10,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "protein",
                      modifier: (double value) {
                        final roundedValue = value.round();
                        return '$roundedValue';
                      },
                    ),
                  ),
                  min: nutrition.protein!.confidenceRange95Percent!.min! - 100,
                  max: nutrition.protein!.confidenceRange95Percent!.max! +100,
                  initialValue: nutrition.protein!.value!,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    counterClockwise: false,
                    customColors: CustomSliderColors(
                      progressBarColors: [
                        Colors.red[900]!,
                        Colors.red[800]!,
                        Colors.red[700]!,
                        Colors.red[600]!,
                        Colors.red[500]!,
                        Colors.red[400]!,
                        Colors.red[300]!,
                        Colors.red[200]!,
                      ],
                      trackColor: Colors.red[100],
                      dotColor: Colors.white,
                      gradientStartAngle: 0,
                      gradientEndAngle: 180,
                    ),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 12,
                      trackWidth: 10,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "fat",
                      modifier: (double value) {
                        final roundedValue = value.round();
                        return '$roundedValue';
                      },
                    ),
                  ),
                  min: nutrition.fat!.confidenceRange95Percent!.min! -100,
                  max: nutrition.fat!.confidenceRange95Percent!.max! +100,
                  initialValue: nutrition.fat!.value!,
                ),
                Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.red[300]!,
                        Colors.red[200]!,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Fat",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Max ${nutrition.fat!.confidenceRange95Percent!.max!.round() +100} g",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Min ${nutrition.fat!.confidenceRange95Percent!.min!.round() -100} g",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
