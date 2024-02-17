import 'package:flutter/material.dart';
import 'package:food_recipes/core/core.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatelessWidget {
  final LottieBuilder lottie;
  final String subText;
  final String text;

  const Page1(
      {super.key,
      required this.lottie,
      required this.subText,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 100,
            child: Container(
              height: 540,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                color: Color(0xfff2d0ac),
                backgroundBlendMode: BlendMode.softLight,
              ),
            )),
        Positioned(
          top: 40,
          right: 10,
          left: 10,
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.6,
            width: MediaQuery.sizeOf(context).width,
            child: lottie,
          ),
        ),
        Positioned(
          bottom: 170,
          right: 10,
          left: 10,
          child: Container(
            height: 160,
            width: 400,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      text,
                      style: TextStylesT.kMainHeadLine,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      subText,
                      style: TextStylesT.kSubHeadLine,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
