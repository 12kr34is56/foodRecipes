import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';

import '../../../../model/food_substitute.dart';
import '../../../widgets/food_widget/back_button_widget.dart';

class GetIngredientsSubstitute extends StatefulWidget {
  const GetIngredientsSubstitute({super.key});

  @override
  State<GetIngredientsSubstitute> createState() =>
      _GetIngredientsSubstituteState();
}

class _GetIngredientsSubstituteState extends State<GetIngredientsSubstitute> {
  TextEditingController controller = TextEditingController();

  FoodSubstitute? foodSubstitute;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //background image
            Container(
              height: height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/s1.jpg'),
                    fit: BoxFit.fitHeight),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 12.0,left: 10.0),
              child: BackButtonWidget(),
            ),

            //white container
            Positioned(
              top: height * 0.15,
              left: width * 0.1,
              right: width * 0.1,
              child: Container(
                height: height * 0.3,
                width: width * 0.75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    backgroundBlendMode: BlendMode.softLight),
              ),
            ),

            //Enter the Food Ingredient
            Positioned(
              top: height * 0.18,
              left: width * 0.15,
              right: width * 0.15,
              child: const Text(
                "Enter the Food Ingredient",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),

            //TextField
            Positioned(
              top: height * 0.25,
              left: width * 0.15,
              right: width * 0.15,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                    filled: true,
                    hintText: "eg. wheat floor , butter",
                    fillColor: Colors.white),
              ),
            ),

            //Submit
            Positioned(
              top: height * 0.37,
              left: width * 0.36,
              right: width * 0.36,
              child: Container(
                height: height * 0.06,
                width: width * 0.3,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    backgroundBlendMode: BlendMode.softLight),
                child: InkWell(
                  onTap: () {
                    SpoonacularApi.getFoodSubstitute(text: controller.text)
                        .then((value) {
                      print(value.status);

                      setState(() {
                        foodSubstitute = value;
                      });
                    });
                  },
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),

            //output
            if(foodSubstitute!=null)
            Positioned(
              top: height * 0.5,
              left: width * 0.35,
              right: width * 0.3,
              child: Container(
                child: Text(
                  "Output",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),

            //Output white container
            if(foodSubstitute!=null)
            Positioned(
              top: height * 0.58,
              left: width * 0.05,
              right: width * 0.05,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      backgroundBlendMode: BlendMode.softLight),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            foodSubstitute?.status == "success"
                                ? "${foodSubstitute?.message}"
                                : "${foodSubstitute?.message}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: foodSubstitute?.substitutes?.length,
                            itemBuilder: (context, index) {
                              if(foodSubstitute!.status == "failure"){
                                return Text("");
                              }else{
                                return
                                Column(
                                  children: [
                                    Text(
                                      foodSubstitute?.substitutes?[index]?? "",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Divider()
                                  ],
                                );
                              }

                            },
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
