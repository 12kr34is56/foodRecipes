import 'package:flutter/material.dart';
import 'package:food_recipes/model/FoodModel.dart';
import 'package:food_recipes/model/RecipeModels.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required TabController tabController,
    required this.height,
    required this.currentRecipe,
  }) : _tabController = tabController;

  final TabController _tabController;
  final double height;
  final AnalyzedInstructions currentRecipe;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orangeAccent.withOpacity(0.1),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.pink,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.pink,
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Ingredients",
                ),
                Tab(
                  text: "Steps",
                ),
                Tab(
                  text: "Equipments",
                )
              ],
            ),
            SizedBox(
              height: height * 0.3,
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      height: height * 0.3, // Adjust as needed
                      child: ListView.builder(
                        itemCount: currentRecipe.steps!.length,
                        itemBuilder: (context, innerIndex) {
                          final currentStep = currentRecipe.steps![innerIndex];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Column(
                                  // Use Column instead of nested ListView.builder
                                  children: [
                                    for (final currentIngredient
                                        in currentStep.ingredients!)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: ListTile(
                                          // tileColor: Colors.pinkAccent.withOpacity(0.1),
                                          leading: SizedBox(
                                            height: 80,
                                            width: 80,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.network(
                                                "https://spoonacular.com/cdn/ingredients_100x100/${currentIngredient.image}",
                                                fit: BoxFit.fill,
                                                errorBuilder: (BuildContext,
                                                    Object, StackTrace) {
                                                  return Icon(Icons.error);
                                                },
                                              ),
                                            ),
                                          ),
                                          title: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color:
                                                    Colors.white.withOpacity(0.5)),
                                            child: Center(
                                              child: Text(
                                                currentIngredient.name!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              // Add a divider between steps if desired
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.4,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: currentRecipe.steps!.length,
                      itemBuilder: (context, innerIndex) {
                        final currentStep = currentRecipe.steps![innerIndex];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Step ${currentStep.number}: ${currentStep.step}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),

                            Divider(
                              endIndent: 20,
                              indent: 20,
                              thickness: 2,
                              color: Colors.pink,
                            ), // Add a divider between steps
                          ],
                        );
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: height * 0.3, // Adjust as needed
                      child: ListView.builder(
                        itemCount: currentRecipe.steps!.length,
                        itemBuilder: (context, innerIndex) {
                          final currentStep = currentRecipe.steps![innerIndex];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  // Use Column instead of nested ListView.builder
                                  children: [
                                    for (final currentEquipment
                                    in currentStep.equipment!)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: ListTile(
                                          // tileColor: Colors.pinkAccent.withOpacity(0.1),
                                          leading: SizedBox(
                                            height: 80,
                                            width: 80,
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              child: Image.network(
                                                "https://spoonacular.com/cdn/equipments_100x100/${currentEquipment.image}",
                                                fit: BoxFit.fill,
                                                errorBuilder: (BuildContext,
                                                    Object, StackTrace) {
                                                  return Icon(Icons.error);
                                                },
                                              ),
                                            ),
                                          ),
                                          title: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                color:
                                                Colors.pink.withOpacity(0.1)),
                                            child: Center(
                                              child: Text(
                                                currentEquipment.name!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              // Add a divider between steps if desired
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
