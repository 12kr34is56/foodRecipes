import 'package:flutter/material.dart';
import 'package:food_recipes/presentation/screens/home_screen/robot_screen.dart';
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

                const OptionNames(
                  name: "Breakfast Under 20 mins",
                ),
                //space
                const SizedBox(
                  height: 15,
                ),
                FetchTypeCarouselSliderCard(
                  width: width,
                  height: height,
                  name: 'Breakfast',
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
                  name: "Side Dish",
                ),
                //space
                const SizedBox(
                  height: 15,
                ),
                FetchTypeCarouselSliderCard(
                  width: width,
                  height: height,
                  name: 'Side Dish',
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
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0, right: 10.0),
        child: ClipOval(
          child: Material(
            // button color
            child: InkWell(
              splashColor: Colors.grey,
              child: SizedBox(
                  width: 56,
                  height: 56,
                  child: Image.asset(
                    "assets/icons/chatbot.png",
                    fit: BoxFit.cover,
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatScreen()));
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
