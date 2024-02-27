import 'package:flutter/material.dart';
import 'package:food_recipes/model/FoodModel.dart';
import 'package:pie_chart/pie_chart.dart';

import 'homeScreen.dart';

class FoodNutritionScreen extends StatefulWidget {
  const FoodNutritionScreen(
      {super.key, required this.foodData, required this.name});
  final String name;
  final FoodModel foodData;

  @override
  State<FoodNutritionScreen> createState() => _FoodNutritionScreenState();
}

class _FoodNutritionScreenState extends State<FoodNutritionScreen> {
  @override
  Widget build(BuildContext context) {
    final data = widget.foodData.results![0];

    Map<String, double> dataMap = {
      "Protein": data.nutrition!.caloricBreakdown!.percentCarbs!,
      "Fat": data.nutrition!.caloricBreakdown!.percentFat!,
      "Carbs": data.nutrition!.caloricBreakdown!.percentCarbs!,
    };
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(data.image!),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Stack(
          children: [

            //back button
            Positioned(
              top: height * 0.03,
              left: width * 0.05,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),


            //white container
            Positioned(
              top: height * 0.1,
              left: width * 0.05,
              right: width * 0.05,
              child: Container(
                height: height,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),

            //Nutrition's of food
            Positioned(
              top: height * 0.12,
              left: width * 0.06,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Nutrition's of ${widget.name}",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
                ),
              ),
            ),

            //Pie chart
            Positioned(
              top: height * 0.2,
              right: width * 0.1,
              child: PieChart(
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.bottom,
                ),
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartType: ChartType.ring,
                chartRadius: MediaQuery.of(context).size.width / 3,
                chartLegendSpacing: 32,
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: false,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              ),
            ),

            //Nutrition's list
            Positioned(
              top: height * 0.2,
              left: width * 0.1,
              right: width * 0.1,
              child: SizedBox(
                height: height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: ListView.builder(
                            itemCount: data.nutrition!.nutrients!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  data.nutrition!.nutrients![index].name!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  "${data.nutrition!.nutrients![index].amount!} ${data.nutrition!.nutrients![index].unit!}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
