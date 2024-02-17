import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/presentation/screens/home_screen/cuisine_screen/cuisine.dart';

class FetchCuisineCarouselSliderCard extends StatelessWidget {
  const FetchCuisineCarouselSliderCard({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        CuisineContainer(
          height: height,
          width: width,
          text: "Indian",
          onTap: () {
            SpoonacularApi.getCuisineFood(cuisine: 'indian').then((value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndianScreen(
                    foodUser: value,
                  ),
                ),
              );
            });
          },
        ),
        CuisineContainer(
            height: height,
            width: width,
            text: "French",
            onTap: () {
              SpoonacularApi.getCuisineFood(cuisine: 'French').then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FrenchScreen(
                      foodUser: value,
                    ),
                  ),
                );
              });
            }),
        CuisineContainer(
            height: height, width: width, text: "Asian", onTap: () {
          SpoonacularApi.getCuisineFood(cuisine: 'Asian').then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AsianScreen(
                  foodUser: value,
                ),
              ),
            );
          });
        }),
        CuisineContainer(
            height: height, width: width, text: "German", onTap: () {
          SpoonacularApi.getCuisineFood(cuisine: 'German').then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GermanScreen(
                  foodUser: value,
                ),
              ),
            );
          });
        }),
        CuisineContainer(
            height: height, width: width, text: "Mexican", onTap: () {
          SpoonacularApi.getCuisineFood(cuisine: 'Mexican').then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MexicanScreen(
                  foodUser: value,
                ),
              ),
            );
          });
        }),
        CuisineContainer(
            height: height, width: width, text: "Caribbean", onTap: () {
          SpoonacularApi.getCuisineFood(cuisine: 'Caribbean').then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CaribbeanScreen(
                  foodUser: value,
                ),
              ),
            );
          });
        }),
        CuisineContainer(
            height: height, width: width, text: "Italian", onTap: () {
          SpoonacularApi.getCuisineFood(cuisine: 'Italian').then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItalianScreen(
                  foodUser: value,
                ),
              ),
            );
          });
        }),
        CuisineContainer(
            height: height, width: width, text: "Korean", onTap: () {
          SpoonacularApi.getCuisineFood(cuisine: 'Korean').then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => KoreanScreen(
                  foodUser: value,
                ),
              ),
            );
          });
        }),
        CuisineContainer(
            height: height, width: width, text: "European", onTap: () {
          SpoonacularApi.getCuisineFood(cuisine: 'European').then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EuropeanScreen(
                  foodUser: value,
                ),
              ),
            );
          });
        }),
        CuisineContainer(
            height: height, width: width, text: "Japanese", onTap: () {
          SpoonacularApi.getCuisineFood(cuisine: 'Japanese').then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JapaneseScreen(
                  foodUser: value,
                ),
              ),
            );
          });
        }),
      ],
      options: CarouselOptions(
        height: height * 0.06,
        viewportFraction: 0.4,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class CuisineContainer extends StatelessWidget {
  const CuisineContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.onTap});

  final double height;
  final double width;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
            backgroundBlendMode: BlendMode.overlay),
        height: height * 0.08,
        width: width,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
