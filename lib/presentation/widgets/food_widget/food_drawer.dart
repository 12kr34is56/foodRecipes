import 'package:flutter/material.dart';
import 'package:food_recipes/core/core.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/presentation/screens/home_screen/drawer_feature/amount_convert.dart';
import 'package:food_recipes/presentation/screens/home_screen/drawer_feature/random_food_trivia.dart';
import 'package:food_recipes/presentation/widgets/food_widget/find_the_nutrition.dart';
import '../../screens/home_screen/drawer_feature/get_ingredient_substitute.dart';
import '../../screens/home_screen/drawer_feature/random_food_joke.dart';

class FoodDrawer extends StatelessWidget {
  const FoodDrawer({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(
              'assets/images/d1.jpg',
            ),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: height * 0.3,
              child: DrawerHeader(
                child: CircleAvatar(
                  radius: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.4),
              ),
              child: Column(
                children: [
                  FeatureTile(
                    name: "Convert Amount",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AmountConvert()));
                    },
                    icon: Image.asset('assets/icons/coffee-cup.png'),
                  ),
                  // FeatureTile(
                  //   name: "Random Recipe",
                  //   onTap: () {},
                  //   icon: Image.asset('assets/icons/surprise-box.png'),
                  // ),
                  FeatureTile(
                    name: "Guess nutrient by dish ",
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FindTheNutrition();
                          }).then((value) => Navigator.pop(context));
                    },
                    icon: Image.asset('assets/icons/thinker.png'),
                  ),
                  FeatureTile(
                    name: "get ingredient substitute",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const GetIngredientsSubstitute()));
                    },
                    icon: Image.asset('assets/icons/shuffle.png'),
                  ),
                  FeatureTile(
                    name: "Random Food Joke",
                    onTap: () {
                      SpoonacularApi.getRandomJokes().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RandomFoodJoke(
                                      name: value,
                                    )));
                      });
                    },
                    icon: Image.asset('assets/icons/medical.png'),
                  ),
                  FeatureTile(
                    name: "Random Food Trivia",
                    onTap: () {
                      SpoonacularApi.getRandomJokes().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RandomFoodTrivia(
                                      name: value,
                                    )));
                      });
                    },
                    icon: Image.asset('assets/icons/medical.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  const FeatureTile(
      {super.key, required this.name, required this.onTap, this.icon});

  final String name;
  final Function()? onTap;
  final Image? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.green,
      selectedColor: Colors.green,
      leading: SizedBox(height: 40, width: 44, child: icon),
      title: Text(
        name,
        style: TextStylesT.kDrawerStyle,
      ),
      onTap: onTap,
    );
  }
}
