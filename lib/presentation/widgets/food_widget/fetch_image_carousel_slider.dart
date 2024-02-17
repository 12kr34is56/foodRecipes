import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:shimmer/shimmer.dart';

class FetchVegCarouselSliderCard extends StatelessWidget {
  const FetchVegCarouselSliderCard({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SpoonacularApi.getVegetarianFood(),
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
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
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

class FetchGlutenFreeCarouselSliderCard extends StatelessWidget {
  const FetchGlutenFreeCarouselSliderCard({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SpoonacularApi.getGlutenFreeFood(),
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
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
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

class CarouselShimmerEffect extends StatelessWidget {
  const CarouselShimmerEffect({
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: width * 0.75,
            height: height * 0.23,
            child: Shimmer.fromColors(
              baseColor: Color(0xffc7c7c7),
              highlightColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ),

      ],
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
      ),
    );
  }
}

class FoodImage extends StatelessWidget {
  const FoodImage(
      {super.key,
      required this.height,
      required this.width,
      required this.image});

  final double height;
  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: width,
          height: height,
          imageUrl: image,
          progressIndicatorBuilder: (BuildContext, String, DownloadProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
