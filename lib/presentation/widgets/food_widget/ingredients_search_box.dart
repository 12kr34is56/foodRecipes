import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/presentation/screens/home_screen/generated_list_dish_screen.dart';
import 'package:food_recipes/presentation/widgets/auth_widgets/utilButton.dart';
import 'package:simple_chips_input/simple_chips_input.dart';

class IngredientsSearchBox extends StatefulWidget {
  const IngredientsSearchBox({super.key});

  @override
  State<IngredientsSearchBox> createState() => _IngredientsSearchBoxState();
}

class _IngredientsSearchBoxState extends State<IngredientsSearchBox> {
  List<String> ingredients = [];
  final keySimpleChipsInput = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();
  final TextFormFieldStyle style = const TextFormFieldStyle(
    cursorColor: Colors.blue,
    decoration: InputDecoration(
      hintStyle: TextStyle(color: Colors.black),
      hintText: "Add ingredients",
      contentPadding: EdgeInsets.all(0.0),
      border: InputBorder.none,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 15,
              offset: const Offset(5, 10), // changes position of shadow
            ),
          ],
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Text("Generate a dish from the ingredients you have",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SimpleChipsInput(
                    separatorCharacter: ",",
                    chipTextStyle: const TextStyle(color: Colors.black),
                    focusNode: focusNode,
                    deleteIcon: const Icon(Icons.close),
                    validateInput: true,
                    validateInputMethod: (val) {
                      if (val.isEmpty) {
                        return "Please enter the ingredient";
                      }
                    },
                    formKey: keySimpleChipsInput,
                    onChipAdded: (data) {
                      ingredients.add(data);
                      print(data);
                    },
                    widgetContainerDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    chipContainerDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.pink.shade100,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 90.0, right: 90.0, bottom: 20.0),
              child: GestureDetector(
                onTap: () async {
                  if (ingredients.isNotEmpty) {
                    await SpoonacularApi.getGeneratedDish(dish: ingredients)
                        .then(
                      (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GeneratedListDishScreen(dishList: value),
                          ),
                        );
                      },
                    );
                  }
                  return;
                },
                child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.pink.shade300,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Generate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
