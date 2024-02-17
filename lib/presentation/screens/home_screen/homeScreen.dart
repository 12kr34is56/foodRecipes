import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/presentation/widgets/food_widget/custom_app_bar.dart';
import 'package:food_recipes/presentation/widgets/food_widget/fetch_cuisine_carousel_slider.dart';
import 'package:food_recipes/presentation/widgets/food_widget/fetch_image_carousel_slider.dart';
import 'package:food_recipes/presentation/widgets/food_widget/food_drawer.dart';
import 'package:food_recipes/presentation/widgets/food_widget/ingredients_search_box.dart';

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
    SpoonacularApi.getFood();
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
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Vegetarian Food",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          )),
                    ],
                  ),
                ),
                //space
                const SizedBox(
                  height: 15,
                ),
                FetchVegCarouselSliderCard(width: width, height: height),
                //Gulten Free food

                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Gluten Food",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          )),
                    ],
                  ),
                ),
                //space
                const SizedBox(
                  height: 15,
                ),
                FetchGlutenFreeCarouselSliderCard(width: width, height: height),
                //todo create the bottom navigation bar
              ],
            ),
          ),
        ],
      ),
    );
  }
}
