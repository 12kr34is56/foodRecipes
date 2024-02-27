import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/model/search_model.dart';
import 'package:food_recipes/presentation/screens/home_screen/dish_screen.dart';
import 'package:http/http.dart' as http;

class RecipeSearchScreen extends StatefulWidget {
  const RecipeSearchScreen({super.key});

  @override
  _RecipeSearchScreenState createState() => _RecipeSearchScreenState();
}

class _RecipeSearchScreenState extends State<RecipeSearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<SearchModel> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/d5.jpg"),
                fit: BoxFit.fitHeight)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) async {
                  try {
                    List<SearchModel> results =
                        await SpoonacularApi.searchRecipes(value);
                    setState(() {
                      _searchResults = results;
                    });
                  } catch (error) {
                    print('Error: $error');
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search Recipes',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _searchResults.clear();
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        backgroundBlendMode: BlendMode.softLight,
                      ),
                      child: ListTile(
                        onTap: () async {
                          try {
                            final foodData = await SpoonacularApi.getFoodData(
                              name: _searchResults[index].title!,
                            );
                            // Check if the results list is not empty
                            if (foodData.results != null && foodData.results!.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DishScreen(dish: foodData.results![0]),
                                ),
                              );
                            } else {
                              // Handle the case when results are empty
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('No results found'),
                                ),
                              );


                              print('No results found for ${_searchResults[index].title}');
                            }
                          } catch (error) {
                            print('Error: $error');
                          }
                        },

                        enabled: true,
                        leading: const ClipRRect(
                          child: Icon(CupertinoIcons.arrow_right_circle_fill),
                        ),
                        title: Text(_searchResults[index].title.toString()),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
