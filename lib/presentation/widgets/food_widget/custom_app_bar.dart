import 'package:flutter/material.dart';
import 'package:food_recipes/core/core.dart';
import 'package:food_recipes/data/login_auth_api.dart';
import 'package:food_recipes/presentation/screens/profile_screen/profile_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    bool isAppBarExpanded = true;
    String  name = LoginAuth.user!.displayName!;
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      leading: Builder(builder: (context) {
        return IconButton(
          color: Colors.white,
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
      actions: [
        Padding(
          padding:  const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: LoginAuth.user != null
                  ? ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(LoginAuth.user!.photoURL!))
                  : const Icon(
                      Icons.person,
                      color: Colors.pinkAccent,
                    ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext, BoxConstraints) {
          isAppBarExpanded = BoxConstraints.biggest.height > 100;
          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(
              left: width * 0.14,
              bottom: height * 0.01,
            ),
            collapseMode: CollapseMode.parallax,
            title: isAppBarExpanded
                ? Align(
                    alignment: Alignment.bottomLeft,
                    //todo change the color the of user name
                    child: Text(
                      'Hey $name \nwhat you do wanna make',
                      style: TextStylesT.kHomeTitleStyle,
                    ),
                  )
                : Text(
                    'Yum Hub',
                    style: TextStylesT.kHomeTitleStyle2,
                  ),
            background: Image.asset(
              'assets/images/t4.jpg',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
