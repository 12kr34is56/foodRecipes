import 'package:flutter/material.dart';
import 'package:food_recipes/core/core.dart';

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
                    onTap: () {},
                    icon: Image.asset('assets/icons/coffee-cup.png'),
                  ),
                  FeatureTile(
                    name: "Random Recipe",
                    onTap: () {},
                    icon: Image.asset('assets/icons/surprise-box.png'),
                  ),
                  FeatureTile(
                    name: "Guess nutrient by dish ",
                    onTap: () {},
                    icon: Image.asset('assets/icons/thinker.png'),
                  ),
                  FeatureTile(
                    name: "get ingredient substitute",
                    onTap: () {},
                    icon: Image.asset('assets/icons/shuffle.png'),
                  ),
                  FeatureTile(
                    name: "get Meal plan",
                    onTap: () {},
                    icon: Image.asset('assets/icons/medical.png'),
                  ),
                  FeatureTile(
                    name: "Generate Meal Day",
                    onTap: () {},
                    icon: Image.asset('assets/icons/add.png'),
                  ),
                  FeatureTile(
                    name: "Wine recommendation",
                    onTap: () {},
                    icon: Image.asset('assets/icons/like.png'),
                  ),
                  FeatureTile(
                    name: "Quick Answer",
                    onTap: () {},
                    icon: Image.asset('assets/icons/response.png'),
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

// FeatureTile(
//   name: "Random Recipe",
//   onTap: () {},
//   icon: Image.asset('assets/icons/surprise-box.png'),
// ),
// FeatureTile(
//   name: "Guess nutrient by dish ",
//   onTap: () {},
//   icon: Image.asset('assets/icons/thinker.png'),
// ),
// FeatureTile(
//   name: "get ingredient substitute",
//   onTap: () {},
//   icon: Image.asset('assets/icons/shuffle.png'),
// ),
// FeatureTile(
//   name: "get Meal plan",
//   onTap: () {},
//   icon: Image.asset('assets/icons/medical.png'),
// ),
// FeatureTile(
//   name: "Generate Meal Day",
//   onTap: () {},
//   icon: Image.asset('assets/icons/add.png'),
// ),
// FeatureTile(
//   name: "Wine recommendation",
//   onTap: () {},
//   icon: Image.asset('assets/icons/like.png'),
// ),
// FeatureTile(
//   name: "Quick Answer",
//   onTap: () {},
//   icon: Image.asset('assets/icons/response.png'),
// ),

class FeatureTile extends StatelessWidget {
  const FeatureTile(
      {super.key, required this.name, required this.onTap, this.icon});

  final String name;
  final Function()? onTap;
  final Image? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(height: 40, width: 44, child: icon),
      title: Text(
        name,
        style: TextStylesT.kDrawerStyle,
      ),
      onTap: onTap,
    );
  }
}
