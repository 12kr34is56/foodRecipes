import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/data/login_auth_api.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [

                    SizedBox(
                      height: height,
                    ),

                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(12)),
                        height: height * 0.22,
                        width: width * 0.9,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                        radius: 100,
                        child: Image.network(
                          LoginAuth.user!.photoURL!,
                          fit: BoxFit.fill,
                          height: 200,
                          width: 200,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
