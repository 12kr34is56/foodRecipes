import 'package:flutter/material.dart';
import 'package:food_recipes/presentation/screens/near_me/near_me.dart';
import 'package:lottie/lottie.dart';

import 'feature/geolocation.dart';

class GeolocationFetchingScreen extends StatefulWidget {
  const GeolocationFetchingScreen({super.key});

  @override
  State<GeolocationFetchingScreen> createState() =>
      _GeolocationFetchingScreenState();
}

class _GeolocationFetchingScreenState extends State<GeolocationFetchingScreen> {
  Geo geo = Geo();
  @override
  void initState() {
    try {
      geo.determinePosition().then((value) {
        print("get location => ${value!.latitude} + ${value.longitude}");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NearMe(
                      latitude: value.latitude.toString(),
                      longitude: value.longitude.toString(),
                    )));
      });
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Fetching Your Location...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

            Lottie.asset('assets/jsons/json11.json'),
          ],
        ),
      ),
    );
  }
}
