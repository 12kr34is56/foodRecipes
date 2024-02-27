import 'package:flutter/material.dart';
import 'package:food_recipes/presentation/screens/home_screen/homeScreen.dart';
import 'package:food_recipes/presentation/screens/home_screen/mainScreen.dart';
import 'package:food_recipes/presentation/screens/near_me/restaurantInfo.dart';

import '../../../data/spoonacular_API.dart';
import '../../widgets/food_widget/back_button_widget.dart';

class NearMe extends StatefulWidget {
  const NearMe({super.key, this.latitude, this.longitude});
  final String? latitude;
  final String? longitude;
  @override
  State<NearMe> createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainScreen()));
          return Future.value(false);
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/r2.jpg",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0,left: 10.0),
                child: BackButtonWidget(),
              ),


              const Text(
                "Restaurants Near You",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: FutureBuilder(
                    future: SpoonacularApi.restaurantFetchingApi(
                        widget.latitude!.toString(),
                        widget.longitude!.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Scrollbar(
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, left: 20, right: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      backgroundBlendMode: BlendMode.softLight,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RestautantInfo(
                                                      name: snapshot
                                                          .data![index].title
                                                          .toString(),
                                                    )));
                                      },
                                      leading: Icon(
                                        Icons.restaurant_menu_outlined,
                                        size: 35,
                                      ),
                                      title: Text(
                                        snapshot.data![index].title.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Text(snapshot
                                          .data![index].address!.label
                                          .toString()),
                                    ),
                                  ),
                                );
                              }),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


