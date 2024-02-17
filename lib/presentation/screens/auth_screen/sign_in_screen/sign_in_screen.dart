import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/data/login_auth_api.dart';
import 'package:food_recipes/presentation/screens/auth_screen/sign_in_screen/sign_in_bloc/sign_in_bloc.dart';
import 'package:food_recipes/presentation/widgets/widget.dart';
import 'package:go_router/go_router.dart';
import 'package:food_recipes/core/core.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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

            //login
            Form(
              key: _formKey,
              child: Positioned(
                top: height * 0.32,
                left: width * 0.1,
                right: width * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
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
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            children: [
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
                              InputContainer(
                                controller: passwordController,
                                text: "********",
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
                              Padding(
                                padding: EdgeInsets.only(right: 4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    context.go('/forgotPassword');
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BlocConsumer<SignInBloc, SignInState>(
                                listener: (context, state) {
                                  if(state.status == SignInStatus.success){
                                    context.go('/home');
                                  }

                                },
                                builder: (context, state) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 80),
                                    child: CustomButton(
                                        text: "Login",
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context.read<SignInBloc>().add(
                                                LoginPressedEvent(
                                                    email: emailController.text,
                                                    password: passwordController
                                                        .text));
                                          }
                                        }),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Center(
                                child: Text(
                                  "or",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80, vertical: 5),
                                  child: CustomButton2(
                                    text: "Sign Up",
                                    onTap: () {
                                      context.go('/signUp');
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: height * 0.04,
              left: width * 0.2,
              right: width * 0.2,
              child: BlocConsumer<SignInBloc, SignInState>(
                listener: (context, state) {
                  if (state.status == SignInStatus.success) {
                    context.go('/home');
                  }
                },
                builder: (context, state) {

                  switch (state.status) {
                    case SignInStatus.loading:
                      return const Center(child: CircularProgressIndicator());
                    case SignInStatus.failure:
                      return Text(
                        state.failure,
                        style: TextStyle(color: Colors.red),
                      );
                      case SignInStatus.initial:
                  return GestureDetector(
                    onTap: () {
                      context.read<SignInBloc>().add(GooglePressedEvent());
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.75,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.pink, width: 2),
                        backgroundBlendMode: BlendMode.softLight,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Sign in with ",
                                  style: TextStylesT.kSignInStyle2,
                                  children: [
                                    TextSpan(
                                        text: "Google",
                                        style: TextStylesT.kGoogle),
                                  ],
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                    case SignInStatus.success:
                      return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
