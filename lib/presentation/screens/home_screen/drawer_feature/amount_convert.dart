import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:food_recipes/model/conversion_amount.dart';
import 'package:simple_chips_input/select_chips_input.dart';

import '../../../widgets/food_widget/back_button_widget.dart';
import '../../../widgets/food_widget/unit_button.dart';

class AmountConvert extends StatefulWidget {
  const AmountConvert({super.key});

  @override
  State<AmountConvert> createState() => _AmountConvertState();
}

class _AmountConvertState extends State<AmountConvert> {
  String sourceUnitData = '';
  String targetUnitData = '';
  String sourceData = '';
  double sourceDataAmount = 0.0;

  AmountConversion? amountConversion;

  TextEditingController amountController = TextEditingController();
  TextEditingController ingredientController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //background image
            Container(
              height: height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/d4.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0,left: 10.0),
              child: BackButtonWidget(),
            ),
            //output text
            Positioned(
              top: height * 0.15,
              left: width * 0.35,
              right: width * 0.2,
              child: const Text(
                "Output ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            //output container
            Positioned(
              top: height * 0.2,
              left: width * 0.05,
              right: width * 0.05,
              child: Container(
                height: height * 0.1,
                width: width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  backgroundBlendMode: BlendMode.softLight,
                ),
                child: Center(
                  child: Text(
                    amountConversion?.answer ?? "",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),

            //white container
            Positioned(
              top: height * 0.35,
              left: width * 0.1,
              right: width * 0.1,
              child: Container(
                height: height * 0.5,
                width: width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  backgroundBlendMode: BlendMode.softLight,
                ),
              ),
            ),

            //amount convert text
            Positioned(
              top: height * 0.35,
              left: width * 0.2,
              right: width * 0.2,
              child: const Text(
                "Amount Convert",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            //source unit text
            Positioned(
                top: height * 0.45,
                left: width * 0.13,
                child: const Text(
                  "Source Unit",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                )),

            //source unit button
            Positioned(
              top: height * 0.44,
              right: width * 0.15,
              child: UnitButton(
                chipsText: const [
                  'cups',
                  'teaspoons',
                  'gram',
                  'pounds',
                  'ounces',
                  'tablespoons'
                ],
                title: "Select the Source Unit",
                sourceTitle:
                    sourceUnitData.isEmpty ? "Source\n Unit" : sourceUnitData,
                onTapCallback: (output) {
                  setState(() {
                    sourceUnitData = output;
                  });
                },
              ),
            ),

            //ingredient text
            Positioned(
                top: height * 0.52,
                left: width * 0.13,
                child: const Text(
                  "Ingredient",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                )),

            //ingredient text field
            Positioned(
              top: height * 0.52,
              right: width * 0.15,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: width * 0.35,
                  height: 40,
                  child: TextField(
                    scrollPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setState(() {
                        sourceData = value;
                      });
                    },
                    controller: ingredientController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'eg floor, sugar',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ),
            ),

            //amount text
            Positioned(
                top: height * 0.6,
                left: width * 0.13,
                child: const Text(
                  "Amount",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                )),

            //amount text field
            Positioned(
              top: height * 0.6,
              right: width * 0.15,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: width * 0.3,
                  height: 40,
                  child: TextField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    scrollPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setState(() {
                        sourceDataAmount = double.parse(value);
                      });
                    },
                    controller: amountController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'eg 1,1.5,2',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ),
            ),

            //target unit text
            Positioned(
                top: height * 0.68,
                left: width * 0.13,
                child: const Text(
                  "Target Unit",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                )),

            //target unit button
            Positioned(
              top: height * 0.68,
              right: width * 0.15,
              child: UnitButton(
                chipsText: const [
                  'cups',
                  'teaspoons',
                  'gram',
                  'pounds',
                  'ounces',
                  'tablespoons'
                ],
                title: "Select the Target",
                sourceTitle:
                    targetUnitData.isEmpty ? "Target\n Unit" : targetUnitData,
                onTapCallback: (output) {
                  setState(() {
                    targetUnitData = output;
                  });
                },
              ),
            ),

            //convert button
            Positioned(
              top: height * 0.8,
              left: width * 0.32,
              right: width * 0.32,
              child: GestureDetector(
                onTap: () async {
                  if (sourceUnitData.isNotEmpty &&
                      targetUnitData.isNotEmpty &&
                      sourceData.isNotEmpty &&
                      sourceDataAmount != 0.0) {
                    await SpoonacularApi.getFoodConvert(
                            ingredientName: sourceData,
                            sourceAmount: sourceDataAmount,
                            sourceUnit: sourceUnitData,
                            targetUnit: targetUnitData)
                        .then((value) {
                      print(value.answer);
                      setState(() {
                        amountConversion = value;
                      });

                    });
                  }
                },
                child: Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                      child: Text(
                    "Convert",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w800),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
