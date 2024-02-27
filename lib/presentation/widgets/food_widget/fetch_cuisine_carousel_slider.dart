import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/presentation/screens/home_screen/cuisine_screen/cuisine.dart';

import '../../screens/home_screen/cuisine_screen/cuisine_bloc/cuisine_bloc.dart';

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
    return BlocConsumer<CuisineBloc, CuisineState>(
      listener: (context, state) {
        if (state.status == CuisineStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to fetch data')),
          );
        } else if (state.status == CuisineStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data fetched successfully')),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CuisineScreen(
                foodUser: state.cuisine,
                cuisineName: state.cuisineName,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return CarouselSlider(
          items: [
            CuisineContainer(
              height: height,
              width: width,
              text: "Indian",
              onTap: () {
                context
                    .read<CuisineBloc>()
                    .add(FetchCuisineEvent(cuisine: 'Indian'));
              },
            ),
            CuisineContainer(
                height: height,
                width: width,
                text: "French",
                onTap: () {
                  context
                      .read<CuisineBloc>()
                      .add(FetchCuisineEvent(cuisine: 'French'));
                }),
            CuisineContainer(
                height: height,
                width: width,
                text: "Asian",
                onTap: () {
                  context
                      .read<CuisineBloc>()
                      .add(FetchCuisineEvent(cuisine: 'Asian'));
                }),
            CuisineContainer(
                height: height,
                width: width,
                text: "German",
                onTap: () {
                  context
                      .read<CuisineBloc>()
                      .add(FetchCuisineEvent(cuisine: 'German'));
                }),
            CuisineContainer(
                height: height,
                width: width,
                text: "Mexican",
                onTap: () {
                  context
                      .read<CuisineBloc>()
                      .add(FetchCuisineEvent(cuisine: 'Mexican'));
                }),
            CuisineContainer(
                height: height,
                width: width,
                text: "Caribbean",
                onTap: () {
                  context
                      .read<CuisineBloc>()
                      .add(FetchCuisineEvent(cuisine: 'Caribbean'));
                }),
            CuisineContainer(
                height: height,
                width: width,
                text: "Italian",
                onTap: () {
                  context
                      .read<CuisineBloc>()
                      .add(FetchCuisineEvent(cuisine: 'Italian'));
                }),
            CuisineContainer(
                height: height,
                width: width,
                text: "Korean",
                onTap: () {
                  context
                      .read<CuisineBloc>()
                      .add(FetchCuisineEvent(cuisine: 'Korean'));
                }),
            CuisineContainer(
                height: height,
                width: width,
                text: "European",
                onTap: () {
                  context
                      .read<CuisineBloc>()
                      .add(FetchCuisineEvent(cuisine: 'European'));
                }),
            CuisineContainer(
                height: height,
                width: width,
                text: "Japanese",
                onTap: () {
                  context
                      .read<CuisineBloc>()
                      .add(FetchCuisineEvent(cuisine: 'Japanese'));
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
      },
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
