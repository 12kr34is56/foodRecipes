import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/core/core.dart';
import 'package:food_recipes/presentation/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:food_recipes/presentation/screens/auth_screen/sign_up_screen/bloc/sign_up_bloc.dart';
import 'package:food_recipes/presentation/screens/home_screen/mainScreen.dart';
import 'package:food_recipes/presentation/widgets/widget.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Image.asset(
                "assets/images/lg1.jpg",
                fit: BoxFit.cover,
              ),
            ),

            //company logo
            Positioned(
                top: 30,
                left: 120,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                )),

            //background Blend
            Positioned(
                top: height * 0.24,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: height * 0.6,
                    width: width,
                    decoration: const BoxDecoration(
                        color: Color(0xff645132),
                        backgroundBlendMode: BlendMode.softLight),
                  ),
                )),

            //company Name
            Positioned(
              top: height * 0.215,
              left: width * 0.24,
              child: Text(
                "Yum Hub",
                style: TextStylesT.kCompanyName2,
              ),
            ),

            //Sign Up
            Form(
              key: _formKey,
              child: Positioned(
                top: height * 0.32,
                left: width * 0.1,
                right: width * 0.1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        // height: height * 0.45,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.white,
                            backgroundBlendMode: BlendMode.softLight),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: [
                              //user name
                              InputContainer(
                                controller: userController,
                                text: "user name",
                                icon: Icons.person,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your user name";
                                  }
                                  return null;
                                },
                              ),

                              //email
                              InputContainer(
                                controller: emailController,
                                text: "food12@gmail.com",
                                icon: Icons.email,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your email";
                                  } else if (!value.contains("@")) {
                                    return "Please enter a valid email";
                                  }
                                  return null;
                                },
                              ),

                              //password
                              InputContainer(
                                controller: passwordController,
                                text: "********",
                                icon: Icons.lock,
                                isVisible: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your password";
                                  } else if (value.length < 6) {
                                    return "Password must be at least 6 characters";
                                  }
                                  return null;
                                },
                              ),

                              //confirm password
                              InputContainer(
                                controller: confirmPasswordController,
                                text: "confirm password",
                                isVisible: false,
                                icon: Icons.lock,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your password";
                                  } else if (value.length < 6) {
                                    return "Password must be at least 6 characters";
                                  }
                                  return null;
                                },
                              ),

                              //size box
                              const SizedBox(
                                height: 10,
                              ),

                              //sign up button
                              BlocConsumer<SignUpBloc, SignUpState>(
                                listener: (context, state) {
                                  state.isSignUpSuccessful
                                      ? Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()))
                                      : null;
                                },
                                builder: (context, state) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 80),
                                    child: CustomButton(
                                        text: "Sign Up",
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context.read<SignUpBloc>().add(
                                                  SignUpButtonPressed(
                                                    userName:
                                                        userController.text,
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                    confirmPassword:
                                                        confirmPasswordController
                                                            .text,
                                                  ),
                                                );
                                          }
                                        }),
                                  );
                                },
                              ),

                              //size box
                              const SizedBox(
                                height: 5,
                              ),

                              //or
                              const Center(
                                child: Text(
                                  "or",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),

                              //size box
                              const SizedBox(
                                height: 5,
                              ),

                              //login button
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80),
                                  child: CustomButton2(
                                    text: "Login",
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignInScreen()));
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
