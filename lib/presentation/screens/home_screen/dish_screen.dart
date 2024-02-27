import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/model/FoodModel.dart';
import 'package:food_recipes/model/RecipeModels.dart';
import 'package:food_recipes/model/food_energy.dart';
import 'package:food_recipes/presentation/screens/home_screen/cuisine_screen/nutrition_screen.dart';
import 'package:food_recipes/presentation/screens/home_screen/cuisine_screen/video_bloc/video_bloc.dart';
import 'package:food_recipes/presentation/widgets/food_widget/youtube_video_widget.dart';
import 'package:food_recipes/presentation/widgets/widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:developer' as dev;

import 'cuisine_screen/cuisine_bloc/cuisine_bloc.dart';

class DishScreen extends StatefulWidget {
  const DishScreen({super.key, required this.dish});
  final Results dish;

  @override
  State<DishScreen> createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<VideoBloc>().add(FetchDishVideoEvent(dishName: widget.dish.title!));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    dynamic time = widget.dish.readyInMinutes;
    if (time >= 60) {
      time = time / 60;
    }
    final List<AnalyzedInstructions> recipe = widget.dish.analyzedInstructions!;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dish.title!),
      ),
      body: ListView.builder(
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
                // color: Colors.pink[50],
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.dish.image!,
                      ),
                      fit: BoxFit.cover,
                      opacity: 0.5),
                ),
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
                child: FoodSummaryWidget(
                    summary:
                        SpoonacularApi.removeHtmlTags(widget.dish.summary!)),
              ),

              //upper divider
              Positioned(
                top: height * 0.5,
                child: Container(
                  height: 2,
                  width: 330,
                  color: Colors.pinkAccent, // Set the color of your divider
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
                          Text(widget.dish.nutrition!.ingredients!.length
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
                  color: Colors.pinkAccent, // Set the color of your divider
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
                    Column(
                      children: [
                        Text("Energy"),
                        Text(widget.dish.nutrition!.nutrients![0].amount
                            .toString()),
                      ],
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
                  color: Colors.pinkAccent, // Set the color of your divider
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
                  title: widget.dish.title!,
                  height: height,
                  width: width,
                ),
              ),

              Positioned(
                top: height * 1.25,
                child: GestureDetector(
                  onTap: () async {
                    await SpoonacularApi.getNutritionOfDish(
                            dishName: widget.dish.title!)
                        .then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NutritionScreen(
                              nutrition: value, dish: widget.dish),
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
      ),
    );
  }
}
