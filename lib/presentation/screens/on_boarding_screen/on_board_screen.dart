import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/core/contants/contants.dart';
import 'package:food_recipes/presentation/routes/routeNames.dart';
import 'package:food_recipes/presentation/screens/on_boarding_screen/bloc/on_board_screen_bloc.dart';
import 'package:food_recipes/presentation/widgets/widget.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';


class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //background image
          SizedBox(
            height: MediaQuery
                .sizeOf(context)
                .height,
            child: Image.asset(
              'assets/images/bg6.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),

          //company name
          Positioned(
            top: 50,
            left: 90,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Yum Hub",
                style: TextStylesT.kCompanyName,
              ),
            ),
          ),

          //page view
          PageView(
            controller: controller,
            children: [
              Page1(
                lottie: Lottie.asset(
                  'assets/jsons/eat_healthy.json',
                ),
                subText: "Browse thousand of recipes from all over the world ",
                text: "Healthy Recipes",
              ),
              Page1(
                lottie: Lottie.asset('assets/jsons/time_track.json'),
                text: "Track Your Health",
                subText:
                "With amazing inbuilt tool you can make your own meal plan",
              ),
              Page1(
                lottie: Lottie.asset('assets/jsons/thinking.json'),
                text: "Eat Healthy",
                subText:
                "Maintaining good health should be the primary focus of everyone",
              ),
            ],
          ),

          //dots
          SmoothDot(controller: controller),

          //get started button
          Positioned(
            bottom: 60,
            left: 32,
            child: BlocConsumer<OnBoardScreenBloc, OnBoardScreenState>(
              listener: (context, state) {
                if(state.screens == '/signUp'){
                  context.go('/signUp');
                }
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: (){
                    context.read<OnBoardScreenBloc>().add(NavigationToSignUp());
                  },
                  child: UtilButton(
                      text: "Get Started"
                  ),
                );
              },
            ),
          ),

          //sign in
          Positioned(
            bottom: 25,
            left: 40,
            child: BlocListener<OnBoardScreenBloc, OnBoardScreenState>(
              listener: (context, state) {
                if (state.screens == '/signIn') {
                  context.goNamed('signIn');
                }
              },
              child: GestureDetector(
                onTap: () {
                  context.read<OnBoardScreenBloc>().add(NavigationToSignIn());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account?",
                    style: TextStylesT.kTextStyle,
                    children: [
                      TextSpan(
                        text: " Sign In",
                        style: TextStylesT.kSignInStyle,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
