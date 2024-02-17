import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/model/RecipeModels.dart';
import 'package:food_recipes/model/food_energy.dart';
import 'package:food_recipes/presentation/screens/home_screen/cuisine_screen/nutrition_screen.dart';
import 'package:food_recipes/presentation/widgets/food_widget/youtube_video_widget.dart';
import 'package:food_recipes/presentation/widgets/widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:developer' as dev;

class DishScreen extends StatefulWidget {
  const DishScreen(
      {super.key,
      required this.dish,
      required this.summary,
      required this.foodEnergy});

  final FoodUser dish;
  final FoodSummary summary;
  final FoodEnergy foodEnergy;

  @override
  State<DishScreen> createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.withOpacity(0.15),
        title: Text(widget.dish.title!),
      ),
      body: FutureBuilder(
        future: SpoonacularApi.getDishInstruction(id: widget.dish.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //shimmer effect
            return ShimmerLoadingEffect(width: width, height: height);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            final List<RecipeModels> recipe = snapshot.data!;
            int number = SpoonacularApi.calculateTotalIngredients(recipe);
            dynamic time = SpoonacularApi.calculateTotalTime(recipe);
            if (time >= 60) {
              time = time / 60;
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: recipe.length,
              itemBuilder: (context, outerIndex) {
                final currentRecipe = recipe[outerIndex];
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    //whole background
                    Container(
                      height: height * 1.33,
                      color: Colors.pink[50],
                    ),

                    //image
                    Positioned(
                      top: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FancyShimmerImage(
                          imageUrl: widget.dish.image!,
                          boxFit: BoxFit.cover,
                          height: 380,
                          width: 350,
                        ),
                      ),
                    ),

                    //summary
                    Positioned(
                      top: 200,
                      child: FoodSummaryWidget(summary: widget.summary),
                    ),

                    //upper divider
                    Positioned(
                      top: height * 0.5,
                      child: Container(
                        height: 2,
                        width: 330,
                        color:
                            Colors.pinkAccent, // Set the color of your divider
                      ),
                    ),

                    //Ingredients
                    Positioned(
                        top: height * 0.5155,
                        left: width * 0.06,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/ingredient.png",
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                Text("Ingredients"),
                                Text(SpoonacularApi.calculateTotalIngredients(
                                        recipe)
                                    .toString())
                              ],
                            )
                          ],
                        )),

                    //middle divider one
                    Positioned(
                      top: height * 0.51,
                      left: width * 0.36,
                      child: Container(
                        height: height * 0.06,
                        width: 2,
                        color: Colors.pinkAccent,
                        // Set the color of your divider
                      ),
                    ),

                    //Time
                    Positioned(
                      top: height * 0.5155,
                      left: width * 0.4,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/time.png",
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            children: [
                              Text("Time"),
                              Text((time is double)
                                  ? "${time.toStringAsFixed(2)}hr"
                                  : "${time.toString()}min")
                            ],
                          )
                        ],
                      ),
                    ),

                    //middle divider two
                    Positioned(
                      top: height * 0.51,
                      right: width * 0.34,
                      child: Container(
                        height: height * 0.06,
                        width: 2,
                        color:
                            Colors.pinkAccent, // Set the color of your divider
                      ),
                    ),

                    //Energy
                    Positioned(
                      top: height * 0.5155,
                      left: width * 0.69,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/energy.png",
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          FutureBuilder(
                            future: SpoonacularApi.getFoodEnergy(
                                dishName: widget.summary.title),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.none) {
                                return Text("No Energy");
                              } else if (snapshot.hasError) {
                                return Text("Error: ${snapshot.error}");
                              } else {
                                var data = snapshot.data;

                                if (data is FoodEnergy) {
                                  // Assuming you have the necessary logic to retrieve the actual value
                                  var energyValue =
                                      widget.foodEnergy.calories?.value ??
                                          "N/A";

                                  return Column(
                                    children: [
                                      Text("Energy"),
                                      Text(energyValue.toString()),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    children: [
                                      Text("Energy"),
                                      Text("N/A"),
                                    ],
                                  );
                                }
                              }
                            },
                          )
                        ],
                      ),
                    ),

                    //lower divider
                    Positioned(
                      top: height * 0.58,
                      child: Container(
                        height: 2,
                        width: 330,
                        color:
                            Colors.pinkAccent, // Set the color of your divider
                      ),
                    ),

                    // Steps
                    Positioned(
                      top: height * 0.6,
                      left: 10,
                      right: 10,
                      child: TabBarWidget(
                          tabController: _tabController,
                          height: height,
                          currentRecipe: currentRecipe),
                    ),

                    Positioned(
                      top: height,
                      child: YoutubeVideoWidget(
                        summary: widget.summary,
                        height: height,
                        width: width,
                      ),
                    ),

                    Positioned(
                      top: height * 1.25,
                      child: GestureDetector(
                        onTap: () async {
                          await SpoonacularApi.getNutritionOfDish(
                                  dishName: widget.summary.title)
                              .then(
                            (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NutritionScreen(nutrition: value,dish: widget.dish),
                              ),
                            ),
                          );
                        },
                        child: UtilButton(
                          text: "Get Nutrition",
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
