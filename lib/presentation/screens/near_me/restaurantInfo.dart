import 'package:flutter/material.dart';
import 'package:food_recipes/data/spoonacular_API.dart';

class RestautantInfo extends StatefulWidget {
  final String? name;
  const RestautantInfo({super.key, this.name});

  @override
  State<RestautantInfo> createState() => _RestautantInfoState();
}

class _RestautantInfoState extends State<RestautantInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/r3.jpeg",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: FutureBuilder(
              future: SpoonacularApi.restaurantMenuFetchingApi(widget.name!),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      final restaurantData = snapshot.data;
                      return Scrollbar(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                margin: EdgeInsets.all(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.restaurant_menu_outlined,size: 100,),

                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Name: ${restaurantData?.about?.name ?? ""}"),
                                          Text(
                                              "Ratings: ${restaurantData?.about?.ratings ?? ""}"),
                                          Text(
                                              "Locality: ${restaurantData?.about?.locality ?? ""}"),
                                          Text(
                                              "Area Name: ${restaurantData?.about?.areaName ?? ""}"),
                                          Text(
                                              "City: ${restaurantData?.about?.city ?? ""}"),
                                          Text(
                                              "Cuisines: ${restaurantData?.about?.cuisines?.join(", ") ?? ""}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Menu",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (restaurantData?.menu != null)
                                ...restaurantData!.menu!.map((menu) {
                                  return Card(
                                    margin: EdgeInsets.all(8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Title: ${menu.title ?? ""}",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          if (menu.dishes != null)
                                            ...menu.dishes!.map((dish) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Color(0xffffd3a8),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: ListTile(
                                                  title: Text(dish.name ?? "",style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),),
                                                  subtitle:
                                                      Text(dish.description ?? ""),
                                                  trailing: Column(
                                                    children: [
                                                      Text("₹${dish.price}" ?? "",style: TextStyle( fontWeight: FontWeight.bold,
                                                        fontSize: 14,),),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        dish.isVeg == true
                                                            ? "Veg"
                                                            : "Non-Veg",
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator(color: Colors.white,));
                    }
                }
              }),
        ),
      ),
    );
  }
}
