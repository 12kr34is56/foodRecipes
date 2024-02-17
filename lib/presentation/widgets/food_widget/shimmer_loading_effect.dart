import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingEffect extends StatelessWidget {
  const ShimmerLoadingEffect({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.9,
              height: height * 0.469,
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

            //space
            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                width: width * 0.8,
                height: height * 0.09,
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

            //space
            const SizedBox(
              height: 10,
            ),

            SizedBox(
              width: width * 0.9,
              height: height * 0.4,
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
          ],
        ),
      ),
    );
  }
}