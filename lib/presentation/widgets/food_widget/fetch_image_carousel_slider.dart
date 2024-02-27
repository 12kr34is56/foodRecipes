import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/presentation/screens/home_screen/dish_screen.dart';
import 'package:food_recipes/presentation/widgets/food_widget/fetch_image.dart';

import 'carousel_shimmer_effect.dart';

class FetchDietCarouselSliderCard extends StatelessWidget {
  const FetchDietCarouselSliderCard({
    super.key,
    required this.width,
    required this.height,
    required this.name,
  });

  final double width;
  final double height;
  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SpoonacularApi.getDietFood(diet: name),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return const Center(child: Text("No data"));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: height * 0.23,
                  child: CarouselShimmerEffect(width: width, height: height),
                ),
              ),
            ],
          );
        } else {
          final data = snapshot.data;
          return CarouselSlider.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, itemIndex, pageViewIndex) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      SpoonacularApi.getFoodData(name: name).then((value) =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DishScreen(
                                      dish: value.results![itemIndex]))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          FoodImage(
                              width: width,
                              height: height,
                              image: snapshot.data![itemIndex].image!),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    backgroundBlendMode: BlendMode.softLight),
                                height: height * 0.08,
                                width: width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        snapshot.data![itemIndex].title!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: height * 0.25,
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ));
        }
      },
    );
  }
}

class FetchTypeCarouselSliderCard extends StatelessWidget {
  const FetchTypeCarouselSliderCard({
    super.key,
    required this.width,
    required this.height,
    required this.name,
  });

  final double width;
  final double height;
  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SpoonacularApi.getTypeFood(type: name,maxReadyTime: 20.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return const Center(child: Text("No data"));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: height * 0.23,
                  child: CarouselShimmerEffect(width: width, height: height),
                ),
              ),
            ],
          );
        } else {
          final data = snapshot.data;
          return CarouselSlider.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, itemIndex, pageViewIndex) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      SpoonacularApi.getFoodData(name: name).then((value) =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DishScreen(
                                      dish: value.results![itemIndex]))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          FoodImage(
                              width: width,
                              height: height,
                              image: snapshot.data![itemIndex].image!),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    backgroundBlendMode: BlendMode.softLight),
                                height: height * 0.08,
                                width: width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        snapshot.data![itemIndex].title!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: height * 0.25,
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ));
        }
      },
    );
  }
}
