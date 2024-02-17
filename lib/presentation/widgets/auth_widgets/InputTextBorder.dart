import 'package:flutter/material.dart';

class InputTextBorder extends StatelessWidget {
  final Widget? child;
  const InputTextBorder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.pink,
            width: 2, // Adjust the border width as needed
          ),
        ),
        child: child,
      ),
    );
  }
}

class InputContainer extends StatelessWidget {
  const InputContainer(
      {super.key,
      required this.controller,
      required this.text,
      this.isVisible = false,
      required this.validator,
      required this.icon});

  final String? Function(String?)? validator;
  final bool isVisible;
  final String text;
  final TextEditingController controller;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InputTextBorder(
        child: TextFormField(
          validator: validator,
      obscureText: isVisible,
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon:
               Icon(icon, color: Colors.white, size: 30),
          hintText: text),
      controller: controller,
    ));
  }
}
