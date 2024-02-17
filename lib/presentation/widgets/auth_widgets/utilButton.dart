import 'package:flutter/material.dart';
import 'package:food_recipes/core/core.dart';

class UtilButton extends StatelessWidget {

  final String text;

  const UtilButton({
    super.key,required this.text,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: Text(
          text,
            style: TextStylesT.kButtonStyle,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 2),
          color: Colors.pink,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}


class CustomButton2 extends StatelessWidget {

  final Function()? onTap;
  final String text;
  const CustomButton2({
    super.key,
    required this.onTap,required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.pink,width: 2),
            borderRadius: BorderRadius.circular(12),
            backgroundBlendMode: BlendMode.softLight
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.pink,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
