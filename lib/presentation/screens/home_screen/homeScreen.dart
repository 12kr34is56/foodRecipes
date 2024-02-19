import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/presentation/widgets/food_widget/custom_app_bar.dart';
import 'package:food_recipes/presentation/widgets/food_widget/fetch_cuisine_carousel_slider.dart';
import 'package:food_recipes/presentation/widgets/food_widget/fetch_image_carousel_slider.dart';
import 'package:food_recipes/presentation/widgets/food_widget/food_drawer.dart';
import 'package:food_recipes/presentation/widgets/food_widget/ingredients_search_box.dart';

import '../../widgets/food_widget/option_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SpoonacularApi.getFood();
    // SpoonacularApi.getGeneratedDish(dish: ['tomato', 'onion', 'garlic']);
  }

  final _notchBottomBarController = NotchBottomBarController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _notchBottomBarController.dispose();
  }

  bool isAppBarExpanded = true;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: FoodDrawer(height: height),
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                //space
                const SizedBox(
                  height: 10,
                ),

                //cuisine option
                FetchCuisineCarouselSliderCard(width: width, height: height),

                //space
                const SizedBox(
                  height: 10,
                ),

                //ingredients search box
                const IngredientsSearchBox(),

                //space
                const SizedBox(
                  height: 5,
                ),
                //vegetarian food
                const OptionNames(
                  name: "Vegetarian",
                ),
                //space
                const SizedBox(
                  height: 15,
                ),
                FetchDietCarouselSliderCard(
                  width: width,
                  height: height,
                  name: 'Vegetarian',
                ),
                //Gulten Free food

                const SizedBox(
                  height: 10,
                ),

                const OptionNames(
                  name: "Gluten Free",
                ),
                //space
                const SizedBox(
                  height: 15,
                ),
                FetchDietCarouselSliderCard(
                  width: width,
                  height: height,
                  name: 'Gluten Free',
                ),

                const SizedBox(
                  height: 10,
                ),

                const OptionNames(
                  name: "Snack Food",
                ),
                //space
                const SizedBox(
                  height: 15,
                ),
                FetchTypeCarouselSliderCard(
                  width: width,
                  height: height,
                  name: 'snack Food',
                ),

                const OptionNames(
                  name: "breakfast",
                ),
                //space
                const SizedBox(
                  height: 15,
                ),
                FetchTypeCarouselSliderCard(
                  width: width,
                  height: height,
                  name: 'breakfast',
                ),

                const OptionNames(
                  name: "salad",
                ),
                //space
                const SizedBox(
                  height: 15,
                ),
                FetchTypeCarouselSliderCard(
                  width: width,
                  height: height,
                  name: 'salad',
                ),

                const OptionNames(
                  name: "main course",
                ),
                //space
                const SizedBox(
                  height: 15,
                ),
                FetchTypeCarouselSliderCard(
                  width: width,
                  height: height,
                  name: 'main course',
                ),

                const OptionNames(
                  name: "dessert",
                ),
                //space
                const SizedBox(
                  height: 15,
                ),
                FetchTypeCarouselSliderCard(
                  width: width,
                  height: height,
                  name: 'dessert',
                ),

                //todo create the bottom navigation bar
              ],
            ),
          ),
        ],
      ),
    );
  }
}
