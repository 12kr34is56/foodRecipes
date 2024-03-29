
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
          fit: BoxFit.fill,
          width: width,
          height: height,
          imageUrl: image,
          progressIndicatorBuilder: (BuildContext, String, DownloadProgress) {
            return  Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white
              ),
              height: height*0.23,
              width: width,
            );
          }),
    );
  }
}