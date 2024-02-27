import 'package:flutter/material.dart';
import 'package:food_recipes/data/login_auth_api.dart';
import 'package:food_recipes/presentation/screens/on_boarding_screen/on_board_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              LoginAuth.signOut().then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => OnBoardScreen()));
              });
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          image: const DecorationImage(
            image: AssetImage(
              "assets/images/r3.jpeg",
            ),
            fit: BoxFit.fill,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage:
                      // _image != null
                      //     ? FileImage(_image!)
                      //     :
                      NetworkImage(LoginAuth.user!.photoURL!),
                  // child: Icon(CupertinoIcons.profile_circled,size: 150,),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              LoginAuth.user?.displayName ?? LoginAuth.user?.email ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(LoginAuth.user?.email ?? ''),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
